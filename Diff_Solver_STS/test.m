Dat; 
dx=1/MM;
M=(b-a)*MM;
dtEXPL=dx*dx/(2*D);
dt=0;
for j=1:N
    c(j)=(2*j-1)*pi/N
    T(j)=dtEXPL\((-1+v)*c(j)+1+v);
    dt=dt+T(j);
end