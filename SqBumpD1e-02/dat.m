%dat.m
MM=512;
Pe=1.0;
nstepsEuler=524801;
a=-4.0;
b=8.0;
tend=100.0;
dtout=tend;
D=0.01; %D1
%D=0.001; %D2
factor=1.0;
t0=0.0;
%A is height of bump at t0
A=5.0;
%Bumps are from xi1 & xi2
xi1=1.0;
xi2=2.0;
ERRcut=1e-3;