%MESH
%Creating a mesh for advection-diffusion model
function [x]=MESH(a,b,M,dx)
x1=a;
x2=x1+(dx/2);
x(1)=x1;
x(2)=x2;
for i=3:M+1
    x(i)=x(2)+(i-2)*dx;
end
x(M+2)=b;
end