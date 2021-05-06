%EULER
function [U,time]=EULER(U,dx,D,M,b,time,dt)
[F]=FLUX(U,dx,D,M,b,time);
[U]=PDE(U,F,dx,dt,time,D,b,M);
end