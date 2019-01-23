# GOAL:
# compute the position of SLE curve at time 1 for different kappa 
# with the same Brownian motion.

# This file is for computation. So use it once or twice.

# STEPS:
# sample one sample of Brownian motion. Do it only once.
# save it in sampleBM_N2000.txt

# file structure on each line Time, Brownian motion 
# we assume that times are equally distributed
# this is prepared in Brownian_motion.m

# kappa = 0:0.1:8
# for each kappa, 
# compute the curve at time 1 using 
# vertical slit method, (or tilted slit method).

# save in file 'gammas_at1.txt'
# file structure on each line: kappa, real part, imag part

# to view gammas, use view_gammas_at1.m

clear all;


# load Brownian motion
file_name = 'sampleBM_N2000.txt';

fid = fopen(file_name);
A = fscanf(fid, '%f %f', [2 inf]);
fclose(fid);
T = A(1,:);
BrM = A(2,:);

% the number of time intervals 
N = length(T) - 1; 
DT = 1/N;





#computation
#open file to save computations
file_name = 'gammas_at1_'+num2str(dk)+'.txt';
fid = fopen(file_name,'w'); #'w' = write

# reverse the driving function
BrM = fliplr(BrM);
dk=0.01
for kappa = 0:dk:8
    z=0;
    U = sqrt(kappa)*BrM;
    for j=1:N+1
      z = vertical_slit_cmap(U(j),DT,z - U(j));
    end
    
  #save in the file
  fprintf(fid,'%2.10f %2.10f %2.10f \n',[kappa; real(z); imag(z)]);
end


fclose(fid); #close the file

% view curve, see file view_gammas_at1.m