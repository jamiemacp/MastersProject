%EULER
function [U]=EULER(U,dx,D,M,V,A,a,b,xi0,sigma,time,dt)
[F,U]=FLUX(U,dx,D,M,V,A,a,b,time,sigma,xi0,dt);
[U]=PDE(U,F,dx,dt,M);
end