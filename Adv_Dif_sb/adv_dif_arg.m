%Adv_Dif_Arg
dat;
V=Pe*D;
fid=fopen('SBD1Pe5uw.txt','wt');
tab=fopen('SquareBumpUpwind.txt','at');
%Tab records   D   Pe   Err@t=25   Err@t=50   Err@t=75
%Err@t=100   nSteps
fprintf(tab,'%6.2e   %6.2e    ',D,Pe);
dx=1/MM;
M=(b-a)*MM;
[x]=MESH(a,b,M,dx);
dtEXPL=1/((V/dx)+(2*D/dx/dx));
dt=factor*dtEXPL;
Nend=round((tend-t0)/dt)+100;
[U]=INIT(x,M,A,xi1,xi2);
nsteps=0;
time=0.0;
%tout=max(dtout,dt);
tout=dtout;
[ERR,uEXACT]=COMPARE(x,D,V,time,M,U,xi1,xi2,A);
OUTPUT(x,U,uEXACT,time,nsteps,M,fid);
for nsteps=1:Nend
    [U,time]=EULER(x,U,dx,D,M,V,A,a,b,xi1,xi2,time,dt);
    
    if time>=tout
        [ERR,uEXACT]=COMPARE(x,D,V,time,M,U,xi1,xi2,A);
        OUTPUT(x,U,uEXACT,time,nsteps,M,fid);
        tout=tout+dtout;
        fprintf('At time= %6.2f, max error = %6.4e \n',time,ERR);
        fprintf(tab,'%6.4e    ',ERR);
    end
    
    if time>=tend
        fprintf('Done, at time=%e, nsteps=%d \n', time, nsteps);
        fprintf('max error = %e\n',ERR);
        break
    end
end
fprintf(tab,'%d\n',nsteps);
fclose(tab);
fclose(fid);