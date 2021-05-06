%PDE
function [U]=PDE(U,F,dx,dt,M)

dtodx=dt/dx;

for i=2:M+1
    U(i)=U(i)+dtodx*(F(i)-F(i+1));
end

end