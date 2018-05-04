function [f,x] = newton(func,deri,x,max_i,tol) 

% Here we use Newton's Method for a one dimensional problem. Our 
% goal is to find a x* such that |f(x*)| = 0 for a maximum number of 
% iterations. 

% Input:
%
% string func        string with the function to evaluate in term of x
% string deri        string with the derivity of the function to evaluate
%                    in term of x
% float  x0          the initial point
% int    max_i       maximun number of iterations
% float  tol         tolerance of the Newton's method

% Output:
%
% A table with the result of the execution with this format:
%
%                     i   |     xi      |  abs(f(xi))
%                   -----------------------------------
%                         |             |

global x_init

fprintf('Iter  |          x              |         |f(x)|            |    |x_k - x_(k-1)| \n');
fprintf('-----------------------------------------------------------------------------------\n');
    %This is the header of the output matrix
              
x_     = x_init;
for i=0:max_i   % This is the statement to begin the iterative process
    
    f   =   eval(func);         %  Function evaluation
    df  =   eval(deri);         %  Derivative evaluation
        
    x_    = x;

    if(abs(f) < tol),                       %This is the stopping criteria  
        fprintf('Solution found!!!\n\n'); 
        fprintf('The solution found: x = %e\n', x); 
        break; 
    end; 
    
    deltax  =   -f/df;           % Find the Newton step. 
    x       =   x + deltax;      % Update x
    
    
    error = abs(x - x_ );        
    fprintf('  %2i  |  % 1.12e   |  % 1.12e    |  % 1.12e    \n',i,x,abs(f),error);  % print output matrix

end 

if i==max_i, 
    fprintf('The solution was not found after %d iterations.\n', max_i); 
end 
    
    