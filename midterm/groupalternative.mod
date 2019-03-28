set materials;
set machines;

param a{machines, materials};
param minutesAv{machines};
param cost{materials};
param weight;
param percentM1{materials};
param percentCopper;
param copper{materials};

var q{j in machines, i in materials} >= 0;

minimize COST:
        sum{j in machines, i in materials} cost[i]*q[j,i];


subject to minutes{j in machines}:
        sum{i in materials} a[j, i]*q[j,i] <= minutesAv[j];

subject to totalweight:
        sum{j in machines, i in materials} q[j,i] = weight;

subject to COPPER:
       sum{j in machines,i in materials} copper[i]*q[j,i] >= percentCopper*weight;

end;
