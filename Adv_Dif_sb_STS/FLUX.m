%James MacPherson
%10/16/19
%Flux
%Create the Flux values for model
function [F,U]=FLUX(U,dx,D,M,V,A,a,b,xi1,xi2,time)
alpha=sqrt(4*D*time);

U(1)=A/2*(erf((a-V*time-xi1)/alpha)-erf((a-V*time-xi2)/alpha));
U(M+2)=A/2*(erf((b-V*time-xi1)/alpha)-erf((b-V*time-xi2)/alpha));

F(2)=V*U(1)-2*D*(U(2)-(U(1)))/dx;
for i=3:M+1
    F(i)=V*U(i-1)-D*((U(i)-U(i-1))/(dx));
end
F(M+2)=V*U(M+1)-2*D*(U(M+2)-(U(M+1)))/dx;
end