%COMPARE

function [ERR,uEXACT]=COMPARE(x,D,V,time,M,U,A,sigma,xi0)
%uEXACT(1:M+2)=zeros;
ERR=0.0;

alpha=sigma+4*D*time;

for i=1:M+2
    uEXACT(i)=A*sqrt(sigma/alpha)*exp(-(x(i)-V*time-xi0)*(x(i)-V*time-xi0)/alpha);
    ERRi=abs(uEXACT(i)-U(i));
    B=[ERRi, ERR];
    ERR=max(B);
end
end