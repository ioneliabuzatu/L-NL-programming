var x >=0; /* soldier */
var y >=0; /* train */ 

 /* Objective function */
maximize z: 3*x + 2*y;

/* Constraints */
s.t. Finishing : 2*x + y <= 100;
s.t. Carpentry : x + y <= 80;
s.t. Demand : x <= 40;

end; 
 

