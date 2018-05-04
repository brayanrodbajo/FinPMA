function [grad, hess] = myfun(x)
  t = [0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1];
  y = [0.1644 0.2581 0.301 0.3319 0.334 0.3053 0.2946 0.263 0.2417 0.2125 0.1923 0.1612 0.1434 0.1212 0.1049 0.0896 0.0774 0.0638 0.0556 0.0473];
  for i=1:length(t)
      jacobian(i, :) = -[x(3)*t(i)*exp(x(1)*t(i)) x(4)*t(i)*exp(x(2)*t(i)) exp(x(1)*t(i)) exp(x(2)*t(i))];
  end
  eval_fun = x(3)*exp(x(1)*t)+x(4)*exp(x(2)*t);
  r = y - eval_fun;
  grad = r*jacobian;
  hess = jacobian*jacobian.'; %se aproxima al primer tErmino de la ecuaciOn
end