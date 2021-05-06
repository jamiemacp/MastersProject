%dat.m
MM=512;
tend=100.0;
dtout=100;
Nend=1000;
factor=1.0;
D=0.01; %D1
%D=0.001; %D2
Pe=0;
a=-4;
b=8.0;
t0=0.0;
%A is height of bump at t0
A=5.0;
%Bumps are from xi1 & xi2
xi1=1.0;
xi2=2.0;

%Comes From Baseline Data
ERRcut=1.0e-3;
nstepsEuler=52481;