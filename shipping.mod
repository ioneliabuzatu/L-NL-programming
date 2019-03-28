set I;
/* canning plants */
set J;
/* markets */
param a{i in I};
/* capacity of plant i in cases */
param b{j in J};
/* demand at market j in cases */
param d{i in I, j in J};
/* distance in thousands of miles */
param f;
/* freight in dollars per case per thousand miles */
param c{i in I, j in J} := f * d[i,j] / 1000;
/* transport cost in thousands of dollars per case */
var x{i in I, j in J} >= 0;
/* shipment quantities in cases */
minimize cost: sum{i in I, j in J} c[i,j] * x[i,j];
/* total transportation costs in thousands of dollars */
s.t. supply{i in I}: sum{j in J} x[i,j] <= a[i];
/* observe supply limit at plant i */
s.t. demand{j in J}: sum{i in I} x[i,j] >= b[j];
/* satisfy demand at market j */
end;
