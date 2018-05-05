function [x_next, fx] = Newton(x_ini,t,y,line,alg)
    
    [~, grad, hess, fx] = myfun(x_ini,t,y);
    % L�mite para SVD
    a=1e-5;
    % Gauss-Newton
    if alg==2
        % Resolver H*pk=-grad (H*x=b) utilizando descomposici�n SVD
        H=hess;
        b=-grad';
        
        [U,S,V]=svd(hess);
        [n,~]=size(S);
        direct=zeros(n,1);
        for i=1:n
            if(S(i,i)>a)
                UCols = U(:,i);
                x=(UCols'*b/S(i,i));
                x=x*V(:,i);
                direct=direct+x;
            end
        end
        direct=direct';
        
        % Calcular sgte iterando
        if line == 1
            alfa = linesearch(x_ini,direct,fx,grad,t,y);
            x_next = x_ini+alfa*direct;
        else
            x_next = x_ini+direct;
        end
    % Levenberg-Marquardt
    else
        % Hallar mu para LM
        u = 1e-3*max(diag(hess));
        % Hallar H para LM
        [~,n]=size(hess);
        H=hess+u*eye(n);
        % Resolver H*pk=-grad (H*x=b) utilizando descomposici�n SVD
        b=-grad';
        
        [U,S,V]=svd(hess);
        [n,~]=size(S);
        direct=zeros(n,1);
        for i=1:n
            if(S(i,i)>a)
                UCols = U(:,i);
                x=(UCols'*b/S(i,i));
                x=x*V(:,i);
                direct=direct+x;
            end
        end
        direct=direct';
        % Calcular sgte iterando
        if line == 1
            alfa = linesearch(x_ini,direct,fx,grad,t,y);
            x_next = x_ini+alfa*direct;
        else
            x_next = x_ini+direct;
        end
        
    end

end 
    