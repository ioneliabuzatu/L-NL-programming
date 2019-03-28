set I;
set Q;
set Qgrad;

param c{I};
param a{I,Q};
param l{I};
param u{I};
param d{Q};
param b{Q};


param r{I,Qgrad};
param gradmin{Qgrad};
param gradmax{Qgrad};



var q{i in I}  >= l[i], <= u[i];

minimize cost: 
	sum{i in I} c[i]*q[i];

subject to quality {j in Q}:
	d[j] <= sum{i in I} a[i,j]*q[i] <= b[j];

subject to gradation_min {j in Qgrad}:
  gradmin[j] * sum{i in I} q[i] <= sum{i in I} r[i,j]*q[i];


#subject to grad_max {j in Qgrad}:
      #  sum{i in I} r{i,j]*q[i]	<= gradmax[j] * sum{i in I} q[i];  

subject to gradation_max {j in Qgrad}:
  sum{i in I} r[i,j]*q[i] <= gradmax[j] * sum{i in I} q[i];

end;


	
