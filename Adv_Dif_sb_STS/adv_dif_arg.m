%Adv_Dif_Arg
dat;
V=Pe*D;
%fid=fopen('D1Pe100nsts50.txt','wt');
tab=fopen('NewTable.txt','at');
dx=1/MM;
M=(b-a)*MM;
[x]=MESH(a,b,M,dx);
dtEXPL=1/((V/dx)+(2*D/dx/dx));
dt=factor*dtEXPL;
[TAU,durSTS]=STS(dtEXPL,nu,Nsts);
Nend=round((tend-t0)/durSTS)+1;
[U]=INIT(x,M,A,xi1,xi2);
nsteps=0;
nSupSteps=0;
time=0.0;
%tout=max(dtout,dt);
tout=dtout;
[ERR,uEXACT]=COMPARE(x,D,V,time,M,U,xi1,xi2,A);
%OUTPUT(x,U,uEXACT,time,nsteps,M,fid);
for nSupSteps=1:Nend
    for j=1:Nsts
        dt=TAU(j);
        nsteps=nsteps+1;
        [U,time]=EULER(x,U,dx,D,M,V,A,a,b,xi1,xi2,time,dt);
    end
    
    if time>=tout
        [ERR,uEXACT]=COMPARE(x,D,V,time,M,U,xi1,xi2,A);
%        OUTPUT(x,U,uEXACT,time,nsteps,M,fid);
        tout=tout+dtout;
    end
    
    if time>=tend
        fprintf('Done, at time=%e, nsteps=%d \n', time, nsteps);
        fprintf('max error = %e\n',ERR);
        break
    end
end
fclose(fid);

if ERR<=ERRcut
    speedup=nstepsEuler/nsteps;
else
    speedup=0;
end

%printing Pe    V   Nsts   nu    nSupSteps   nsteps    ERRmax   Speedup
fprintf(tab,'%6.1 &  %6.3f  & %6.2e &  %d  & %d  &  %d  &  %6.2e  &  %6.2f \n',Pe, V, Nsts, nu, nSupSteps, nsteps, ERR, speedup);
fclose(tab);