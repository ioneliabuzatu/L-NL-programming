set B;
set P;
set BP := B union P;
set M;

param a{M,BP};
param minAV{M};
param u{BP};
param p{BP};
param f{BP};
param f2{BP};

var q{i in BP} >= 0;
var delta{BP} binary;
var gamma binary;
var teta{BP} binary;

maximize utility: sum{i in BP} (q[i]*p[i]-f[i]*delta[i]-f2[i]*teta[i]);

s.t. minutes {j in M}: sum{i in BP} q[i]*a[j,i]/1000 <= minAV[j];

s.t. tot_basic: sum{i in B} q[i] >= 10000;
s.t. tot_premium: sum{i in P} q[i] >= 3000;

s.t. delta_activation {i in BP}: q[i] <= 100000*delta[i];

s.t. cons1_1: q["P1"] >=  sum{i in BP} q[i]*0.25 +  100000*gamma;
s.t. cons1_2: sum{i in P} q[i] - sum{j in B} q[j]*0.80 >= - 100000*gamma;

s.t. cons2_1: q["P4"]  <= 1000  +  100000*(1-gamma);
s.t. cons2_2: q["P3"]  >=  5000  -  100000*(1-gamma);

#s.t. cons1_1: q['P1'] - 0.25 * sum{i in BP} q[i] >= - 10000*gamma;

#s.t. cons1_2: sum{i in P} q[i] - 0.8 * sum{i in B} q[i] >= - 10000*gamma;

#s.t. cons2_1: q['P4'] <= 1000 + 10000*(1-gamma);

#s.t. cons2_2:  q['P3'] >= 5000 +  10000*(1-gamma);
solve;

display utility;

end;



