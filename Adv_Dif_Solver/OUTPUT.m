%OUTPUT
function OUTPUT(x,U,time,nsteps,M,fid)

fprintf(fid,'#At time: %e, nsteps= %d\n\n\n',time,nsteps);
for i=1:M+2
   fprintf(fid,'%e, %e\n',x(i),U(i));
end
fprintf(fid,'\n\n');
end