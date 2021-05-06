%COMPARE

function [ERR,uEXACT]=COMPARE(x,D,V,time,M,U,xi1,xi2,A)
%uEXACT(1:M+2)=zeros;
ERR=0.0;

alpha=sqrt(4*D*time);

for i=1:M+2
    arg1=(x(i)-V*time-xi1)/alpha;
    arg2=(x(i)-V*time-xi2)/alpha;
    uEXACT(i)=A/2*(erf(arg1)-erf(arg2));
    ERRi=abs(uEXACT(i)-U(i));
    B=[ERRi, ERR];
    ERR=max(B);
end
end