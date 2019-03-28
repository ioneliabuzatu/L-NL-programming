set MAT;
set MAC;

param a{MAC,MAT};
param final_wei;
param minutes{MAC};
param cost{MAT};
param copper{MAT};
param copper_blend;
param percent_blend{MAT};

var q{MAT} >= 0;

minimize costMAT: 
	sum{i in MAT} cost[i]*q[i];

subject to total_weight: 
	sum{i in MAT} q[i] = final_wei;

subject to minutesAVAILABLE {j in MAC}:
	sum{i in MAT} a[j,i]*q[i] <= minutes[j];

subject to totCOPPER: sum{i in MAT} copper[i]*q[i] >= copper_blend*final_wei;

subject to tot_blend {i in MAT}:
	 q[i] >= percent_blend[i]*final_wei;

end; 
