set materials;
set machines;

param a{machines, materials};
param minutesAv{machines};
param cost{materials};
param weight;
param percentM1{materials};
param percentCopper;
param copper{materials};

var q{materials} >= 0;

minimize COST:
	sum{i in materials} cost[i]*q[i];


subject to minutes{machine in machines}:
	sum{i in materials} a[machine, i]*q[i] <= minutesAv[machine];

subject to totalweight:
	sum{i in materials} q[i] = weight;



subject to COPPER:
       sum{i in materials} copper[i]*q[i] >= percentCopper*weight;



end;

