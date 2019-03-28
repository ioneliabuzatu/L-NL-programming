set OPERATOR;
set PRODUCT;
set MACHINE;


param profit{PRODUCT};
param hourscons{MACHINE,PRODUCT, OPERATOR};
param hoursavailable{OPERATOR, MACHINE};
param materialConsumed;
param materialAvailable{OPERATOR};


var x{PRODUCT, OPERATOR} >= 0;

maximize profit:
 sum{j in OPERATOR, i in PRODUCT} profit[i]*x[i,j];

subject to hourse_limit {k in MACHINE, j in  OPERATOR}:
 sum{i in PRODUCT} hourscons[i,k,j]*x[i,j] <= hourseavailable[j,k]; 


subject to matter_limit {j in OPERATOR};
 sum{i in PRODUCT} x[i,j]*materialConsumed <= materialAvailable[j];

end;


