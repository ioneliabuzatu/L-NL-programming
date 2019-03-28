set B;
set P;
set MAC;
set PRO := B union P;

param a{MAC, PRO};
param minutes_av{MAC};
param u{PRO};
param profit{PRO};
param penalty{PRO};
param min_basic;
param min_premium;
param bigM;
param F2{PRO};

var x{i in PRO} >= 0;
var delta{PRO} binary;
var gamma binary;
var mu{PRO} binary;

maximize utility: sum{i in PRO} (profit[i]*x[i]-penalty[i]*delta[i]-F2[i]*mu[i]);

subject to minutes_available {j in MAC}: sum{i in PRO} a[j,i]*x[i]/1000 <= minutes_av[j];

subject to tot_basic: sum{i in B} x[i] >= min_basic;

subject to tot_premium: sum{i in P} x[i] >= min_premium;

subject to delta_activation {i in PRO}: x[i] <= u[i]*delta[i];

subject to mu_activation {i in PRO} : x[i] <= u[i]*mu[i]; 

subject to constrain1_1: 
	- sum{ii in PRO} x['P1'] + 0.25*(sum{ii in PRO} x[ii]) <= (sum{ii in PRO} x[ii]) + (bigM*gamma);

subject to constrain1_2:
  - sum{i in P} x[i] + 0.80*(sum{ii in B} x[ii]) <= sum{ii in PRO} x[ii] + (bigM*gamma); 
 
subject to constrain2_1: sum{i in PRO} x['P4'] - 1000 <= sum{ii in PRO} x[ii] + bigM*(1-gamma);

subject to constrain2_2: - sum{i in PRO} x['P3'] + 5000 <= sum{ii in PRO} x[ii] + bigM*(1-gamma);

end;

