function Steepestdescent(x0)
  x= x0
  [grad, hess] = myfun(x)
  while (norm( grad)>0.05)   
    direction = -grad;
    
  end  
end