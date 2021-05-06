Diff_Solver_Tend_100

1. 
factor=0.98 mm=8
Done, at time= 1.000672e+02, nsteps=1307
max error = 4.666105e-05

factor=0.90 mm=8
Done, at time= 1.000547e+02, nsteps=1423
max error = 4.155597e-05

2.
factor=0.90 mm=16
Done, at time= 1.000020e+02, nsteps=5689
max error = 1.072292e-05

3. 
factor=0.90 mm=32
Done, at time= 1.000020e+02, nsteps=22756
max error = 2.721117e-06

factor=0.90 mm=64
Done, at time= 1.000009e+02, nsteps=91023
max error = 6.853168e-07

factor=0.99 mm=32
Done, at time= 1.000006e+02, nsteps=20687
max error = 3.097958e-06

factor=0.99 mm=64
Done, at time= 1.000006e+02, nsteps=82748
max error = 7.802112e-07

4.
factor=1.0 mm=64
Done, at time= 1.000000e+02, nsteps=81920
max error = 7.813291e-03

factor=1.01 mm=64
Done, at time= 1.000001e+02, nsteps=81109
max error = 0.000000e+00

factor=1.1 mm=64
Done, at time= 1.000004e+02, nsteps=74473
max error = 0.000000e+00

5. Noticed anomally with the factors>1.0 so did additional trials changing tend

factor=1.1 mm=64
Done, at time= 1.000098e+01, nsteps=7448
max error = 0.000000e+00

factor=1.1 mm=64
Done, at time= 5.000488e+00, nsteps=3724
max error = 5.993983e+292

factor=1.1 mm=64
Done, at time= 4.000122e+00, nsteps=2979
max error = 6.381154e+233

Comment: U(i) must be blowing up too much to where values are not being saved. That is my best explanation.
U is being recorded NaN except for boundary which we are imposing on it. So it is only reading the imposed boundaries.

6. CODE
=======================================================================================================================
%Dat.m

MM=64;
tend=100.0;
dtout=1.0;
Nend=1000;
factor=1.1;
D=0.1;
a=0.0;
b=1.0;
t0=0.0;
=====================================================================================================================
%James MacPherson
%3/14/19
%Lab 7:Explicit Finite Volume Scheme for Diffusion

Dat; 
%fid=fopen('LAB_7.txt','wt'); 
dx=1/MM;
M=(b-a)*MM;
[x]=MESH(a,b,M,dx);
dtEXPL=dx*dx/(2*D);
dt=factor*dtEXPL;
Nend=round((tend-t0)/dt)+1;
[U]=INIT(x,D,M);
nsteps=0;
time=0.0;
tout=max(dtout,dt);
[ERR,uEXACT]=COMPARE(x,D,time,M,U);
%OUTPUT(uEXACT,x,U,time,nsteps,M,fid);
for nsteps=1:Nend
    [U,time]=EULER(U,dx,D,M,b,time,dt);
    
    if time>=tout
        [ERR,uEXACT]=COMPARE(x,D,time,M,U);
    %    OUTPUT(uEXACT,x,U,time,nsteps,M,fid);
        tout=tout+dtout;
    end
    if time>=tend
        fprintf('Done, at time= %e, nsteps=%d\n',time,nsteps);
        fprintf('max error = %e\n',ERR);
        break
    end
end
%fclose(fid);
%fprintf('x, U, uEXACT\n');
%for i=1:M+2
%    fprintf('For i=%d: %e, %e, %e\n',i,x(i),U(i),uEXACT(i));
%end
======================================================================================================
%COMPARE

function [ERR,uEXACT]=COMPARE(x,D,time,M,U)
uEXACT(1:M+2)=zeros;
ERR=0.0;
for i=1:M+2
    arg=(0.5)*x(i)/sqrt(D*time);
    uEXACT(i)=erfc(arg);
    ERRi=abs(uEXACT(i)-U(i));
    A=[ERRi, ERR];
    ERR=max(A);
end
end
======================================================================================================
%PDE

function [U]=PDE(U,F,dx,dt,time,D,b,M)

U(1)=1.0;
for i=2:M+1
    U(i)=U(i)+dt*(F(i)-F(i+1))/(dx);
end
U(M+2)=erfc(b/(2*sqrt(D*time)));
end
======================================================================================================
%OUTPUT
function OUTPUT(uEXACT,x,U,time,nsteps,M,fid)
fprintf(fid,'At time: %e, nsteps= %d\n\n',time,nsteps);
for i=1:M+2
   fprintf(fid,'%e, %e, %e\n',x(i),U(i),uEXACT(i));
end
fprintf(fid,'\n');
end
=====================================================================================================
%MESH
function [x]=MESH(a,b,M,dx)
x1=a;
x2=x1+(dx/2);
x(1)=x1;
x(2)=x2;
for i=3:M+1
    x(i)=x(2)+(i-2)*dx;
end
x(M+2)=b;
end
==================================================================================================
%INIT
function [U]=INIT(x,D,M)
for i=1:M+2
    U(i)=0.0;
end
end
==================================================================================================
%FLUX

function [F]=FLUX(U,dx,D,M,b,time)

U(1)=1.0;
U(M+2)=erfc(b/(2*sqrt(D*time)));

F(2)=-D*2*((U(2)-U(1))/(dx));
for i=3:M+1
    F(i)=-D*((U(i)-U(i-1))/(dx));
end
F(M+2)=-D*2*((U(M+2)-U(M+1))/(dx));
end
==================================================================================================
%EULER
function [U,time]=EULER(U,dx,D,M,b,time,dt)
time=time+dt;
[F]=FLUX(U,dx,D,M,b,time);
[U]=PDE(U,F,dx,dt,time,D,b,M);
end