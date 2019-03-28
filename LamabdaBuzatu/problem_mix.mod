set P;
set R;

param p{P};
param h{P,P};
param l{P};
param M;
param a{P,R};
param b{R};

var q{i in P} >= l[i];
var lambda{P} >= 0;
var delta{P} binary;
var lambdab{R} >= 0;
var deltab{R} binary;

s.t. grad_obj {i in P, kk in R}:
  2*sum{j in P} h[i,j]*q[j] - p[i] - lambda[i] + sum{k in R} a[i,k]*lambdab[k] - lambdab[kk] = 0;

s.t. complementarity1_01 {i in P}:
  l[i] - q[i] >= - M*delta[i];

s.t. complementarity1_02 {i in P}:
  lambda[i] <= M*(1-delta[i]);

s.t. complementarity2_01 {j in R}:
	sum{i in P} q[i] - b[j] >= - M*deltab[j];

s.t. complementarity2_02 {j in R}:
	lambdab[j] <= M*(1-deltab[j]);

solve;

printf "########################################\n";
display q;
printf "########################################\n";

end;
