function alpha = linesearch(x,deltax,f,i)

global func

%Line Search
    for j=0:5
        alpha      = (1/2)^j;
        x_         = x;                     % store the current point
        x          = x + alpha*deltax;      % find the updated value of x 
        [f_update] = eval(func);            % evaluate the value of f in x+alpha*deltax
                        
                                            % Merit function used: M(x) = |f(x)|
                                           
        value1     = abs(f_update);
        value2     = ((1 - alpha*2*(10^-4) )^(0.5) * abs(f));

        if value1 <=  value2                % to find the accurate value of alpha
            break;
        end 
        
        x          = x_;                    % to update the stored value of x at each iteration
    end                                     % end of Line Search
    
end