param n;
param d;

param z{1..d,1..n};
param y{1..d};

var omega{1..2*n};

s.t. grad_obj1 {k in 1..n}:
  sum{kk in 1..n} sum{i in 1..d} z[i,k]*z[i,kk]*omega[kk] +
  sum{kk in 1..n} sum{i in 1..d} z[i,k]*(z[i,kk]^2)*omega[n+kk] - sum{i in 1..d} z[i,k]*y[i] = 0;

s.t. grad_obj2 {k in 1..n}:
  sum{kk in 1..n} sum{i in 1..d} (z[i,k]^2)*z[i,kk]*omega[kk] +
  sum{kk in 1..n} sum{i in 1..d} (z[i,k]^2)*(z[i,kk]^2)*omega[n+kk] - sum{i in 1..d} (z[i,k]^2)*y[i] = 0;

display z;
display y;

solve;

display omega;
display sum{i in 1..d} ( sum{k in 1..n} z[i,k]*omega[k] + 
        sum{k in 1..n} (z[i,k]^2)*omega[n+k] - y[i] )^2;

end;

