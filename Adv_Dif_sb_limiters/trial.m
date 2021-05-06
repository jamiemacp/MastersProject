a=0;
b=0;
c=a/b;
if isnan(c)
    c=2;
    fprintf('%6.2f',c);
else
    fprintf('false');
end