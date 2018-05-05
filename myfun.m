function [fyt, grad, hess, fx] = myfun(x,t,y)
  for i=1:length(t)
      jacobian(i, :) = -[x(3)*t(i)*exp(x(1)*t(i)) x(4)*t(i)*exp(x(2)*t(i)) exp(x(1)*t(i)) exp(x(2)*t(i))];
  end
  fyt = x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t);
  r = y - fyt;
  grad = r*jacobian;
  hess = jacobian'*jacobian; %se aproxima al primer tErmino de la ecuaciOn
  fx = 1/2*norm(r)^2;
end