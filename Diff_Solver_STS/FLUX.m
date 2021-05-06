%FLUX

function [F]=FLUX(U,dx,D,M,b,time)

U(1)=1.0;
U(M+2)=erfc(b/(2*sqrt(D*time)));

F(2)=-D*2*((U(2)-U(1))/(dx));
for i=3:M+1
    F(i)=-D*((U(i)-U(i-1))/(dx));
end
F(M+2)=-D*2*((U(M+2)-U(M+1))/(dx));
end