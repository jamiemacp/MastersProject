Dat; 
fid=fopen('PurDiffPlot','wt'); 
dx=1/MM;
M=(b-a)*MM;
[x]=MESH(a,b,M,dx);
dtEXPL=dx*dx/(2*D);
dt=factor*dtEXPL;
Nend=round((tend-t0)/dt)+1;
[U]=INIT(x,D,M);
nsteps=0;
time=t0;
tout=max(dtout,dt);
[ERR,uEXACT]=COMPARE(x,D,time,M,U);
OUTPUT(uEXACT,x,U,time,nsteps,M,fid);
for nsteps=1:Nend
    time=t0+nsteps*dt;
    [U,time]=EULER(U,dx,D,M,b,time,dt);
    
    if time>=tout
        [ERR,uEXACT]=COMPARE(x,D,time,M,U);
        OUTPUT(uEXACT,x,U,time,nsteps,M,fid);
        tout=tout+dtout;
    end
end
    if time>=tend
        fprintf('Done, at time= %e, nsteps=%d\n',time,nsteps);
        fprintf('max error = %e\n',ERR);
    end
fclose(fid);
%fprintf('x, U, uEXACT\n');
%for i=1:M+2
%    fprintf('For i=%d: %e, %e, %e\n',i,x(i),U(i),uEXACT(i));
%end