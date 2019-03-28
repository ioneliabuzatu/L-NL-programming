set food;
set nutrition;

param a{nutrition,food};
param cost{food};
param min{nutrition};
param max{nutrition};
param percent;
param third;

var q{food} >=0;

minimize COST:
	sum{f in food} q[f]*cost[f];


subject to requirments {n in nutrition}:
	max[n]  >= sum{f in food} a[n,f]*q[f] >= min[n];


subject to PERCENT {f in food}:
	q[f] >= (sum{ff in food} q[ff])*percent;

subject to THIRD:
	sum{f in food} q[f] = third;

end;
