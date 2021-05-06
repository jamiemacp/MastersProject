%Flux
function [F,U]=FLUX(U,dx,D,M,V,A,a,b,time,sigma,xi0)
alpha=sigma+4*D*time;

U(1)=A*sqrt(sigma/alpha)*exp(-(a-V*time-xi0)*(a-V*time-xi0)/sigma);
U(M+2)=A*sqrt(sigma/alpha)*exp(-(b-V*time-xi0)*(b-V*time-xi0)/sigma);

F(2)=V*U(1)-2*D*(U(2)-(U(1)))/dx;
for i=3:M+1
    F(i)=V*U(i-1)-D*((U(i)-U(i-1))/(dx));
end
F(M+2)=V*U(M+1)-2*D*(U(M+2)-(U(M+1)))/dx;
end