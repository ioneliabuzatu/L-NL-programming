set Operator;
set Machine;
set Product;


param UnitProfit{Product};
param a{Product, Machine, Operator};
param hoursLimit{Machine,Operator};
param materialLimit{Operator};
param cost;

var q{Product, Operator}>= 0;

maximize profit:
	sum{i in Product, j in Operator} UnitProfit[i]*q[i,j];

subject to material_limit {j in Operator}:
	sum{i in Product} cost*q[i,j] <= materialLimit[j];


subject to hours_limit {k in Machine, j in Operator}:
        sum{i in Product} a[i,k,j]*q[i,j] <= hoursLimit[k,j];

end; 
