%James MacPherson
%10/16/19
%Flux
%Create the Flux values for model
function [F]=FLUX(U,dx,D,M,V)
F(2)=0;
for i=3:M+1
    F(i)=V*U(i-1)-D*((U(i)-U(i-1))/(dx));
end
F(M+2)=0;
end