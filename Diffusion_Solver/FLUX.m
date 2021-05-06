%FLUX

function [F]=FLUX(U,dx,D,M,b,time)

U(1)=1;
U(M+2)=erfc(b/(2*sqrt(D*time)));

F(1)=-2*D*((U(2)-U(1))/(dx));
for i=2:M
    F(i)=-D*((U(i+1)-U(i))/(dx));
end
F(M+1)=-D*2*((U(M+2)-U(M+1))/(dx));
end