%PDE

function [U]=PDE(U,F,dx,dt,time,D,b,M)

U(1)=1.0;
for i=2:M+1
    U(i)=U(i)+dt*(F(i)-F(i+1))/(dx);
end
U(M+2)=erfc(b/(2*sqrt(D*time)));
end