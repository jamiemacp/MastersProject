%EULER
function [U]=EULER(U,dx,D,M,V,A,a,b,xi1,xi2,time,dt)
[F,U]=FLUX(U,dx,D,M,V,A,a,b,xi1,xi2,time,dt);
[U]=PDE(U,F,dx,dt,M);
end