%OUTPUT
function OUTPUT(uEXACT,x,U,time,nsteps,M,fid)
fprintf(fid,'#At time: %e, nsteps= %d\n\n',time,nsteps);
for i=1:M+2
   fprintf(fid,'%e, %e, %e\n',x(i),U(i),uEXACT(i));
end
fprintf(fid,'\n');
end