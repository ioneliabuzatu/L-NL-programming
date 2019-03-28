param n;
param d;

param z{1..d,1..n};
param y{1..d};

param m;
param a{1..m,1..n};
param b{1..m};
param M;

var omega{1..n};

var lambda{1..m} >= 0;
var delta{1..m} binary;

s.t. grad_obj {k in 1..n}:
  sum{kk in 1..n} sum{i in 1..d} z[i,k]*z[i,kk]*omega[kk] - sum{i in 1..d} z[i,k]*y[i] +
  sum{j in 1..m} a[j,k]*lambda[j] = 0;

s.t. feasibility {j in 1..m}:
  sum{k in 1..n} a[j,k]*omega[k] <= b[j];

s.t. complementarity1 {j in 1..m}:
  sum{k in 1..n} a[j,k]*omega[k] >= b[j] - M*delta[j];

s.t. complementarity2 {j in 1..m}:
  lambda[j] <= M*(1-delta[j]);


display z;
display y;

solve;

display omega;
display sum{i in 1..d} ( sum{k in 1..n} z[i,k]*omega[k] - y[i] )^2;

end;

