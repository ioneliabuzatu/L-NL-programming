set P;
set R;


param b{R};
param p{P};
param l{P};
param u{P};
param a{P,R};


var q {i in P} >= l[i], <= u[i];

maximize profit:
	sum{i in P} p[i]*q[i];

subject to hourse_limit { j in R}:
	sum{i in P} a[i,j]*q[i] <= b[j];

end;


