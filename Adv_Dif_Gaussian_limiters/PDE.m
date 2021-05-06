%PDE
function [U]=PDE(U,F,dx,dt,M)

for i=2:M+1
    U(i)=U(i)+dt*(F(i)-F(i+1))/dx;
end

end