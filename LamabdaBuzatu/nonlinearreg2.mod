param n;
param d;

param z{1..d,1..n};
param y{1..d};

var omega{1..n};

s.t. grad_obj {k in 1..n}:
  sum{kk in 1..n} sum{i in 1..d} (z[i,k]-5)^2*(z[i,kk]-5)^2*omega[kk] - sum{i in 1..d} (z[i,k]-5)^2*y[i] = 0;

display z;
display y;

solve;

display omega;

printf "ERROR#############################################\n";
display sum{i in 1..d} ( sum{k in 1..n} (z[i,k]-5)^2*omega[k] - y[i] )^2;
printf "##################################################\n";

end;
