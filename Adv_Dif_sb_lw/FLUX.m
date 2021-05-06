%Flux
%Create the Flux values for model
function [F,U]=FLUX(U,dx,D,M,V,A,a,b,xi1,xi2,time,dt)
alpha=sqrt(4*D*time);

U(1)=A/2*(erf((a-V*time-xi1)/alpha)-erf((a-V*time-xi2)/alpha));
U(M+2)=A/2*(erf((b-V*time-xi1)/alpha)-erf((b-V*time-xi2)/alpha));

F(1)=V*(U(1)+U(2))/2-dt/dx*V*V*(U(2)-U(1))-2*D*(U(2)-(U(1)))/dx;
for i=2:M
    F(i)=V*(U(i)+U(i+1))/2-dt/dx/2*V*V*(U(i+1)-U(i))-D*((U(i+1)-U(i))/(dx));
end
F(M+1)=V*(U(M+1)+U(M+2))/2-dt/dx*V*V*(U(M+2)-U(M+1))-2*D*(U(M+2)-U(M+1))/dx;
end