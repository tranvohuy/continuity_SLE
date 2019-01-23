# GOAL:
# compute the whole of SLE_kappa curve on time [0,1] for different kappa 
# with the same Brownian motion.

# STEPS:
# (Brownian_mition.m)
# sample one sample of Brownian motion. Do it only once.
# save it in sampleBM_N2000.txt (2000 small intervals)
# File structure on each line Time, Brownian motion 
# we assume that times are equally distributed



# kappa = 0:0.1:8
# for each kappa:
# -compute the curve using 
# vertical slit method (quicker), (or tilted slit method).
# It takes time. So do it once.
# -save computations in file 'SLE.mat' and 'kappa.mat'
# depends on the computation time, one can break the kappa interval [0,8]
# into smaller intervals. Compute on each one, then combine results using 
# append_matfile.m

# (view_SLE.m)
# this file is to view curves


clear all;
tilted = 1; %more accurate but longer to compute
vertical = 2; % quicker to compute

Ni = 1; %num of extra points in each interval
kappa = 4:0.1:8;
nk = length(kappa);

file_read = 'sampleBM_N2000.txt';

fid = fopen(file_read);
A = fscanf(fid, '%f %f', [2 inf]);
fclose(fid);
T = A(1,:);
BrM = A(2,:);
N = length(T) - 1; 


[K, Ti] = meshgrid(kappa, T);
% each row of K is a copy of kappa
% each column of Ti is a copy of T

X = zeros(size(K));
Y = zeros(size(K));
for i = 1:nk %run through all kappa
  %driving function
  U = sqrt(kappa(i)) * BrM;
  %give the whole curve
  SLE = approximate_LE(U, T, N, Ni, vertical); 
  
  %save this curve to matrix X and Y
  %each column i, is the information of SLE_{kappa_i}
  X(:, i) = real(SLE);
  Y(:, i) = imag(SLE);
endfor

 
% save all information 
save('SLE2.mat','X','Y');
save('kappa2.mat','K');

%to see the simulation, use view_SLE.m