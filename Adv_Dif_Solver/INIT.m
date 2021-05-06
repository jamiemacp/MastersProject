%James MacPherson
%10/16/19
%Initiate
%Create initial U values for advection-diffusion model
%May need to adjust values to match your given boundary
function [U]=INIT(x,D,M)
for i=1:M+2
    U(i)=5.0; %Set each initial U-value to 5.0
    %Fix values for x values less than 1
    if x(i)<1.0
        U(i)=0.0;
    end
    %Fix values for x values greater than 1
    if x(i)>2
        U(i)=0.0;
    end
end
end