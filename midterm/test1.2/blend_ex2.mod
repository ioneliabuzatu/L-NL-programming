set MAT;
set MAC;

param Cost{MAT};
param Weight;
param Cons{MAC,MAT};
param Budget{MAC};
param PercCop{MAT};
param ReqCop;
param PercMin{MAT};

var q{MAT,MAC} >= 0;

minimize total_cost:
  sum{i in MAT, j in MAC} Cost[i]*q[i,j];

subject to final_weight:
  sum{i in MAT, j in MAC} q[i,j] = Weight;

subject to machines_minutes {j in MAC}:
  sum{i in MAT} Cons[j,i]*q[i,j] <= Budget[j];

subject to copper:
  sum{i in MAT, j in MAC} PercCop[i]*q[i,j] >= ReqCop * Weight;

subject to min_perc {i in MAT}:
  sum{j in MAC} q[i,j] >= PercMin[i]*Weight;

end;
