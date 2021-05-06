%OUTPUT
function OUTPUT(uEXACT,x,U,time,nSupSteps,M,fid)
fprintf(fid,'At time: %e, nSupSteps= %d\n\n',time,nSupSteps);
for i=1:M+2
   fprintf(fid,'%e, %e, %e\n',x(i),U(i),uEXACT(i));
end
fprintf(fid,'\n');
end