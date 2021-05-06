%Adv_Dif_Arg
dat;
V=Pe*D;

%fid=fopen('Howdy.txt','wt');
tab=fopen('GssnBump.txt','at');
%Tab records   D   Pe
%Err@t=100   nSteps
dx=1/MM;
M=(b-a)*MM;
[x]=MESH(a,b,M,dx);
dtEXPL=1/((V/dx)+(2*D/dx/dx));
dt=factor*dtEXPL;
[TAU,durSTS]=STS(dtEXPL,nu,Nsts);
Nend=round((tend-t0)/durSTS)+1;
[U]=INIT(x,M,A,xi0,sigma);
nsteps=0;
nSupSteps=0;
time=t0;
tout=max(dtout,dt);
ERR=0.0;
uEXACT=U;
%OUTPUT(x,U,uEXACT,time,nsteps,M,fid);
for nSupSteps=1:Nend
    for j=1:Nsts
        dt=TAU(j);
        nsteps=nsteps+1;
        time=t0+nsteps*dt;
        [U]=EULER(U,dx,D,M,V,A,a,b,xi0,sigma,time,dt);
    end
    
    if time>=tout
        [ERRn,uEXACT]=COMPARE(x,D,V,time,M,U,A,sigma,xi0);
%        OUTPUT(x,U,uEXACT,time,nsteps,M,fid);
        tout=tout+dtout;
        fprintf('At time= %6.2f, max error = %6.4e \n',time,ERRn);
        ERR=max(ERRn,ERR);
    end
end
if time>=tend
    fprintf('Done, at time=%e, nsteps=%d \n', time, nsteps);
    fprintf('max error = %e\n',ERR);
else
    fprintf('ERROR: time</=tend');
end
%if ERR<=ERRcut
%    speedup=nstepsEuler/nsteps;
%else
%    speedup=0;
%end

%printing Pe    V   Nsts   nu    nSupSteps   nsteps    ERRmax   Speedup
fprintf(tab,'%d    %f   %d   %d   %d    %d    %f    %6.2f \n',Pe, V, Nsts, nu, nSupSteps, nsteps, ERR, speedup);
fclose(tab);
%fclose(fid);