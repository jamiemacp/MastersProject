%James MacPherson
%10/16/19
%PDE
%Updating our U values for next step
function [U]=PDE(D,V,U,F,dx,dt,M)
U(1)=(F(2)+2*D/dx*U(2))/(V+2*D/dx);
for i=2:M+1
    U(i)=U(i)+dt*(F(i)-F(i+1))/(dx);
end
U(M+2)=U(M+1)*(V*dx/2/D+1);
end