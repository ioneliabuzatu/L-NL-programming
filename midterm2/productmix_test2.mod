set BASIC;
set PREMIUM;
set PROD := BASIC union PREMIUM;
set MACH;

param Cons{MACH,PROD};
param MaxCons{MACH};
param MinBasic;
param MinPremium;
param u{PROD};
param p{PROD};
param F{PROD};
param F2{PROD};

var q{i in PROD} >= 0;
var delta{PROD} binary;
var gamma binary;
var delta2{PROD} binary;

maximize utility:
  sum{i in PROD} (p[i]*q[i] - F[i]*delta[i] - F2[i]*delta2[i]);

s.t. machine {j in MACH}:
  sum{i in PROD} Cons[j,i]*q[i]/1000 <= MaxCons[j];

s.t. min_basic:
  sum{i in BASIC} q[i] >= MinBasic;

s.t. min_premium:
  sum{i in PREMIUM} q[i] >= MinPremium;

param M;

s.t. activation {i in PROD}:
  q[i] <= M*delta[i];

s.t. activation2 {i in PROD}:
  q[i] <= u[i] + M*delta2[i];

s.t. cons1_1:
  q['P1'] - 0.25 * sum{i in PROD} q[i] >= - M*gamma;

s.t. cons1_2:
  sum{i in PREMIUM} q[i] - 0.8 * sum{i in BASIC} q[i] >= - M*gamma;

s.t. cons2_1:
  q['P4'] - 1000 <= M*(1-gamma);

s.t. cons2_2:
  q['P3'] - 5000 >= - M*(1-gamma);

end;
