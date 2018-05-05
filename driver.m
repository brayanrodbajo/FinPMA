function driver(alg, line)
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
  matprint = [];
  alfa = 1;
  u = 0;
  %inicio iteraciones
  while fx>eps && iter<5000 && dif_iter > eps
      % Seleccionar algoritmo     
      switch alg 
          % Steepest descent
          case 1
            [x_next, fx, alfa]=Steepestdescent(x_ini,t,y,line);
            u= 0;
          % Gauss-Newton   
          case 2
            [x_next, fx, alfa, u]=Newton(x_ini,t,y,line,alg);
          % Levenberg-Marquardt
          case 3
            [x_next, fx, alfa, u]=Newton(x_ini,t,y,line,alg);
      end
      % diferencia entre iterandos
      dif_iter = norm(x_next-x_ini)/norm(x_ini);
      % numero de iteraciones
      iter = iter + 1;
      matprint =  [matprint; [iter, fx, alfa, u]]
      
      % Actualizar iterando inicial
      x_ini = x_next;
      
  end
    csvwrite("iteraciones.csv", matprint)
    disp('Se termina el ciclo. La optimizacion es: ');
    disp(x_ini);
    disp('Numero de iteraciones');
    disp(iter);
    disp('El residuo minimo obtenido es: ');
    disp(fx);
    disp('Diferencia entre iteraciones (criterio parada)');
    disp(dif_iter);

end