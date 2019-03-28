set P;
set R;

param p{P};
param l{P};
param u{P};
param b{R};
param a{P,R};

var q{P,R} >= 0;

maximize alternative_profit:
	sum{i in P, j in R} p[i]*q[i,j];

subject to alternative_resources {j in R}:
	sum{i in P} a[i,j]*q[i,j] <= b[j];

subject to restriction {i in P}:
	l[i] <= sum{j in R} q[i,j] <= u[i];



end;

