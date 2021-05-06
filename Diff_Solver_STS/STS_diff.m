%STS_diff

Dat; 
%fid=fopen('Diff_STS_plot.txt','wt');
tab=fopen('UPDATEDTable.txt','at');
dx=1/MM;
M=(b-a)*MM;
[x]=MESH(a,b,M,dx);
dtEXPL=dx*dx/(2*D);
dt=factor*dtEXPL;
[TAU,durSTS]=STS(dtEXPL,nu,Nsts);
Nend=round((tend-t0)/durSTS)+1;
[U]=INIT(x,D,M);
nSupSteps=0;
nsteps=0;
time=0.0;
tout=max(dtout,dt);
[ERR,uEXACT]=COMPARE(x,D,time,M,U);
%OUTPUT(uEXACT,x,U,time,nSupSteps,M,fid);
for nSupSteps=1:Nend
    for j=1:Nsts
        dt=TAU(j);
        nsteps=nsteps+1;
        [U,time]=EULER(U,dx,D,M,b,time,dt);
    end
        
    if time>=tout
        [ERR,uEXACT]=COMPARE(x,D,time,M,U);
    %    OUTPUT(uEXACT,x,U,time,nSupSteps,M,fid);
        tout=tout+dtout;
    end
    if time>=tend
        fprintf('Done, at time= %e, nsteps=%d and nSupSteps=%d \n',time,nsteps,nSupSteps);
        fprintf('max error = %e\n',ERR);
        break
    end
end
%fclose(fid)

if ERR<=TOL
    speedup=nstepsEuler/nsteps;
else
    speedup=0;
end

%printing Nsts   nu    nSupSteps   nsteps    ERRmax   Speedup
fprintf(tab,'%d & %7.5f & %d & %d & %6.4e & %6.2f \\ \n',Nsts, nu, nSupSteps, nsteps, ERR, speedup);
fclose(tab);