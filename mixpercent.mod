set P;
set R;

param p{P};
param l{P};
param u{P};
param b{R};
param a{P,R};
param minimum{P};
param maximum{P};



var q{i in P} >= l[i], <= u[i];

maximize profit:
        sum{i in P} p[i]*q[i];

subject to hoursi_limit {j in R}:
        sum{i in P} a[i,j]*q[i] <= b[j];

subject to min_percent{i in P}:
        minimum[i]*(sum{ii in P} q[ii]) <= q[i];

subject to max_percent{i in P}:
        maximum[i]*(sum{ii in P} q[ii]) >= q[i];

end;


