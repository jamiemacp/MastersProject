function [a]=MC(b)

c=min(2,(1+b)/2);
d=min(c,2*b);
a=max(0,c);
end