%COMPARE

function [ERRn,uEXACT]=COMPARE(x,D,V,time,M,U,A,sigma,xi0)
ERRn=0.0;

alpha=sigma+4*D*time;

for i=1:M+2
    uEXACT(i)=A*sqrt(sigma/alpha)*exp(-(x(i)-V*time-xi0)*(x(i)-V*time-xi0)/alpha);
    ERRi=abs(uEXACT(i)-U(i));
    ERRn=max(ERRi,ERRn);
end
end