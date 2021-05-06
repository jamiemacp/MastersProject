%Flux
%Create the Flux values for model
function [F,U]=FLUX(U,dx,D,M,V,A,a,b,xi1,xi2,time,dt)
alpha=sqrt(4*D*time);
mu=dt/dx*V;
beta=V/2*(1-mu);

U(1)=A/2*(erf((a-V*time-xi1)/alpha)-erf((a-V*time-xi2)/alpha));
U(M+2)=A/2*(erf((b-V*time-xi1)/alpha)-erf((b-V*time-xi2)/alpha));

%Choose method of solution or phi: minmod, superbee, VanLeer, MC
%Upwind phi=0, LW phi=1

F(2)=V*U(1)+beta*(U(2)-U(1))-D*((U(2)-U(1))/(dx/2));
for i=3:M+1
    theta=(U(i)-U(i-1))/(U(i-1)-U(i-2));
    phi=MC(theta);
    F(i)=V*U(i-1)+beta*(U(i)-U(i-1))*phi-D*((U(i)-U(i-1))/dx);
end

theta=(U(M+2)-U(M+1))/(U(M+1)-U(M));
phi=MC(theta); 
F(M+2)=V*U(M+1)+beta*(U(M+2)-U(M+1))*phi-D*((U(M+2)-U(M+1))/(dx/2));
end