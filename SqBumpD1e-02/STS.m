%SUPER_TIME_STEP
function [TAU,durSTS]=STS(dtEXPL,nu,Nsts)
Pi2=2*atan(1.0);
durSTS=0.0;
for j=1:Nsts
    %Large to small
    supi=(2*j-1.0)/Nsts;
    %Small to large (uncomment next line)
    %supi = 2.0 - supi
    super=(nu-1.0)*cos(supi*Pi2)+nu+1.0;
    TAU(j)=dtEXPL/super;
    durSTS=durSTS+TAU(j);
end
fprintf('Nsts, nu = %d, %6.1e. ==> durSTS= %e \n', Nsts, nu, durSTS);
end
