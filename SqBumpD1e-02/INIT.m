%INIT
function [U]=INIT(x,M,A,xi1,xi2)
U=zeros(1,M+2);
for i=1:M+2
    U(i)=0; %Set each initial U-value to 0.0
    if x(i)>=xi1 && x(i)<=xi2
        U(i)=A;     %Correct values
    end
end
end