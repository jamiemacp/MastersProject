%COMPARE

function [ERR,uEXACT]=COMPARE(x,D,time,M,U)
uEXACT(1:M+2)=zeros;
ERR=0.0;
for i=1:M+2
    arg=(0.5)*x(i)/sqrt(D*time);
    uEXACT(i)=erfc(arg);
    ERRi=abs(uEXACT(i)-U(i));
    ERR=max(ERRi,ERR);
end
end