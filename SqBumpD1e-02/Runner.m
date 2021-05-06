Ns=[30];
nus=[0.0 1.0e-05 1.0e-04 1.0e-03 1.0e-02 1.0e-01];
for k=1
    Nsts=Ns(k);
    for l=1:6
        nu=nus(l);
        SqBumpD1;
    end
end