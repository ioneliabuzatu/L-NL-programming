param n;
param d;

param z{1..d,1..n};
param y{1..d};

var omega{1..n};

s.t. grad_obj {k in 1..n}:
  sum{kk in 1..n} sum{i in 1..d} z[i,k]*z[i,kk]*omega[kk] - sum{i in 1..d} z[i,k]*y[i] = 0;


display z;
display y;

solve;

display omega;
display sum{i in 1..d} ( sum{k in 1..n} z[i,k]*omega[k] - y[i] )^2;

end;

