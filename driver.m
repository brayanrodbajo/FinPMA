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
  norm_grad= 1;
  %inicio iteraciones
  while fx>eps  && dif_iter > eps && norm_grad > eps
      % Seleccionar algoritmo     
      grad = 0;
      switch alg 
          % Steepest descent
          case 1
            [x_next, fx, grad, alfa]=Steepestdescent(x_ini,t,y,line);
          % Gauss-Newton   
          case 2
            [x_next, fx, grad, alfa, u]=Newton(x_ini,t,y,line,alg);
          % Levenberg-Marquardt
          case 3
            [x_next, fx, grad, alfa, u]=Newton(x_ini,t,y,line,alg);
      end
      norm_grad=  norm(grad);
      % diferencia entre iterandos
      dif_iter = norm(x_next-x_ini)/norm(x_ini);
      % numero de iteraciones
      iter = iter + 1;
      %storing table of results
      matprint =  [matprint; [iter, norm_grad, fx, alfa, u]];
      
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
    disp('Norma de gradiente (criterio parada)');
    disp(norm_grad);
end