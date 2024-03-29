model lab82
Real p_cr = 43; 
Real N = 87;
Real q = 1; 
Real tau1 = 27; 
Real tau2 = 20;
Real p1 = 12;
Real p2 = 9.7; 
Real M1;
Real M2;

Real a1 = p_cr/(tau1*tau1*p1*p1*N*q);
Real a2 = p_cr/(tau2*tau2*p2*p2*N*q);
Real b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q);
Real c1 = (p_cr-p1)/(tau1*p1);
Real c2 = (p_cr-p2)/(tau2*p2);

initial equation
M1 = 7.2;
M2 = 8.2;

equation
der (M1) = M1-((b/c1)+0.00014)*M1*M2-(a1/c1)*M1^2;
der(M2) = (c2/c1)*M2-(a2/c1)*M2*M2-(b/c1)*M1*M2;
annotation(experiment( StartTime = 0, StopTime = 30, Tolerance = 1e-06, interval = 0.05));

end lab82;
