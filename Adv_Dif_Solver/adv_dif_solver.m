%James MacPherson
%10/18/19
%Explicit Finite Volume Scheme for Advection-Diffusion
%Solver for an Advection-Diffusion Problem with Neumann BC's
dat;
fid=fopen('8b.txt','wt');
dx=1/MM;
M=(b-a)*MM;
[x]=MESH(a,b,M,dx);
dtEXPL=1/((V/dx)+(2*D/dx/dx));
dt=factor*dtEXPL;
Nend=round((tend-t0)/dt)+100;
[U]=INIT(x,D,M);
nsteps=0;
time=0.0;
%tout=max(dtout,dt);
tout=dtout;
OUTPUT(x,U,time,nsteps,M,fid)
for nsteps=1:Nend
    time=nsteps*dt;
    [F]=FLUX(U,dx,D,M,V);
    [U]=PDE(D,V,U,F,dx,dt,M);
    
    if time>=tout
        OUTPUT(x,U,time,nsteps,M,fid);
        tout=tout+tout;
    end
    
    if time>=tend
        fprintf('Done, at time=%e, nsteps=%f \n', time, nsteps);
        break
    end
end
fclose(fid);