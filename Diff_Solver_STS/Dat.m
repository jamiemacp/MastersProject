%Dat.m

MM=1024;
tend=100.0;
dtout=tend;
Nend=1000;
factor=1.0;
D=0.1;
a=0.0;
b=1.0;
t0=0.0;
%nu Values to test: nu = 0.0,  0.00003,  0.001,  0.01, 0.1
%Nsts Values to test: Nsts = 1,2,10,20,50
TOL=1.0e-03;
nstepsEuler=20971521;