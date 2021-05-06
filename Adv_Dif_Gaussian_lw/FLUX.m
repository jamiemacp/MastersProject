%Flux
function [F,U]=FLUX(U,dx,D,M,V,A,a,b,time,sigma,xi0,dt)
alpha=sigma+4*D*time;

U(1)=A*sqrt(sigma/alpha)*exp(-(a-V*time-xi0)*(a-V*time-xi0)/sigma);
U(M+2)=A*sqrt(sigma/alpha)*exp(-(b-V*time-xi0)*(b-V*time-xi0)/sigma);

F(1)=V*(U(1)+U(2))/2-dt/dx*V*V*(U(2)-U(1))-2*D*(U(2)-(U(1)))/dx;
for i=2:M
    F(i)=V*(U(i)+U(i+1))/2-dt/dx/2*V*V*(U(i+1)-U(i))-D*((U(i+1)-U(i))/(dx));
end
F(M+1)=V*(U(M+1)+U(M+2))/2-dt/dx*V*V*(U(M+2)-U(M+1))-2*D*(U(M+2)-U(M+1))/dx;
end