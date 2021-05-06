%EULER
function [U,time]=EULER(x,U,dx,D,M,V,A,a,b,xi1,xi2,time,dt)
time=time+dt;
[F,U]=FLUX(U,dx,D,M,V,A,a,b,xi1,xi2,time,dt);
[U]=PDE(U,F,dx,dt,M);
end