function [x_next, fx, alfa] = Steepestdescent(x_ini,t,y,line)
    
    % Calcular el gradiente y residuo para cada iteraci�n
    [~,grad,~, fx] = myfun(x_ini, t , y);
    % Calcular direccion de maximo descenso
    direct = -grad;
    alfa = 1;
    % Calcular sgte iterando
    if line == 1
        alfa = linesearch(x_ini,direct,fx,grad,t,y);
    end
    x_next = x_ini+alfa*direct;
end