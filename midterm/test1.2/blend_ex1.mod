set MAT;
set MAC;

param Cost{MAT};
param Weight;
param Cons{MAC,MAT};
param Budget{MAC};
param PercCop{MAT};
param ReqCop;
param PercMin{MAT};

var q{MAT} >= 0;

minimize total_cost:
  sum{i in MAT} Cost[i]*q[i];

subject to final_weight:
  sum{i in MAT} q[i] = Weight;

subject to machines_minutes {j in MAC}:
  sum{i in MAT} Cons[j,i]*q[i] <= Budget[j];

subject to copper:
  sum{i in MAT} PercCop[i]*q[i] >= ReqCop * Weight;

subject to min_perc {i in MAT}:
  q[i] >= PercMin[i]*Weight;

end;
