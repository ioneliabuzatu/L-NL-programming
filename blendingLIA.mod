set NM;
set SM;
set NSM := NM union SM;

param cost{NSM};       
param iron{NSM};
param minIron;
param maxIron;
param maxNM;
param maxSM;
param UnitProfit;

var q{NSM} >= 0;


maximize gain:
	sum{i in NSM} (UnitProfit - cost[i])*q[i];

subject to natiral_limim:
	sum{i in NM} q[i] <= maxNM;

subject to syntetic_limit:
	sum{l in SM} q[l] <= maxSM;

subject to minimumIron:
	minIron*sum{i in NSM} q[i] <= sum{i in NSM} iron[i]*q[i];

subject to maximumIron:
	maxIron*sum{i in NSM} q[i] >= sum{i in NSM} iron[i]*q[i];

end;


	
