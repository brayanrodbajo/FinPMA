function alpha = linesearch(x,direct,fx,grad,t,y)

%Line Search
    for j=0:4
        alpha      = (1/2)^j;
        x          = x + alpha*direct;      % find the updated value of x 
        [~,~,~,fx_next]   = myfun(x,t,y);          % evaluate the value of f in x+alpha*deltax
                       
                                           
        value1     = fx_next;
        value2     = fx+(1e-4)*alpha*grad'*direct;

        if value1 <  value2                % to find the accurate value of alpha
            break;
        end 
    end                                     % end of Line Search
    
end