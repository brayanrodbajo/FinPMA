function driver
    line=1;
  % Cargar datos de archivo adjunto
  load('data.txt');
  t=data(:,1)';
  y=data(:,2)';
  % Punto inicial
  x0 = [-1 -2 1 -1];
  % Establecer criterios de parada
  eps = 1e-6;
  fx = 20;
  dif_iter = 20;
  iter = 0;
  x_ini = x0;
  %inicio iteraciones
  while fx>eps && iter<10000

      % Calcular el gradiente, hessiano y residuo para cada iteración
      [fyt,grad, hess, fx] = myfun(x_ini, t , y);
      
      % Steepest descent
      direct = -grad;
      % Calcular sgte iterando
      if line == 1
          alfa = linesearch(x_ini,direct,fx,grad,t,y);
          x_next = x_ini+alfa*direct;
      else
         x_next = x_ini+direct;
      end
      
      % diferencia entre iterandos
      dif_iter = norm(x_next-x_ini)/norm(x_ini);
      % numero de iteraciones
      iter = iter + 1;
      
      % Actualizar iterando inicial
      x_ini = x_next;
      
  end
  
    disp('Se termina el ciclo. La optimización es: ');
    disp(x_ini);
    disp('Numero de iteraciones');
    disp(iter);
    disp('El residuo mínimo obtenido es: ');
    disp(fx);
    disp('Diferencia entre iteraciones (criterio parada)');
    disp(dif_iter);

end