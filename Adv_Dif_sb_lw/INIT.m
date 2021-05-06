%INIT
function [U]=INIT(x,M,A,xi1,xi2)
for i=1:M+2
    U(i)=A; %Set each initial U-value to 5.0
    %Fix values for x values less than 1
    if x(i)<xi1
        U(i)=0.0;
    end
    %Fix values for x values greater than 1
    if x(i)>xi2
        U(i)=0.0;
    end
end
end