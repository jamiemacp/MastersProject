%EULER
function [U,time]=EULER(U,dx,D,M,V,A,a,b,time,dt,sigma,xi0)
time=time+dt;
[F,U]=FLUX(U,dx,D,M,V,A,a,b,time,sigma,xi0);
[U]=PDE(U,F,dx,dt,M);
end