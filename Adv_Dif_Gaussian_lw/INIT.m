%INIT
function [U]=INIT(x,M,A,xi0,sigma)
for i=1:M+2
    U(i)=A*exp(-(x(i)-xi0)*(x(i)-xi0)/sigma);
end
end