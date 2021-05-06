%James MacPherson
%10/16/19
%PDE
%Updating our U values for next step
function [U]=PDE(U,F,dx,dt,M)

for i=2:M+1
    U(i)=U(i)+dt*(F(i-1)-F(i))/dx;
end

end