function [x_next, fx] = Steepestdescent(x_ini,t,y,line)
    
    % Calcular el gradiente y residuo para cada iteraci�n
    [~,grad,~, fx] = myfun(x_ini, t , y);
    % Calcular direcci�n de m�ximo descenso
    direct = -grad;
             
    % Calcular sgte iterando
    if line == 1
        alfa = linesearch(x_ini,direct,fx,grad,t,y);
        x_next = x_ini+alfa*direct;
    else
        x_next = x_ini+direct;
    end
end