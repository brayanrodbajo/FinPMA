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
  %inicio iteraciones
  while fx>eps && iter<5000
      % Seleccionar algoritmo     
      switch alg 
          % Steepest descent
          case 1
            [x_next, fx]=Steepestdescent(x_ini,t,y,line);
          % Gauss-Newton   
          case 2
            [x_next, fx]=Newton(x_ini,t,y,line,alg);
          % Levenberg-Marquardt
          case 3
            [x_next, fx]=Newton(x_ini,t,y,line,alg);
      end
      % diferencia entre iterandos
      dif_iter = norm(x_next-x_ini)/norm(x_ini);
      % numero de iteraciones
      iter = iter + 1;
      
      % Actualizar iterando inicial
      x_ini = x_next;
      
  end
  
    disp('Se termina el ciclo. La optimizaci�n es: ');
    disp(x_ini);
    disp('Numero de iteraciones');
    disp(iter);
    disp('El residuo m�nimo obtenido es: ');
    disp(fx);
    disp('Diferencia entre iteraciones (criterio parada)');
    disp(dif_iter);

end