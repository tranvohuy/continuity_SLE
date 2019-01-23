%this program createsa sample of Brownian motion on [0,1]
%with N intervals
%
% This code has two parts. 
% The first part is to sample Brownian motion and then save it into 
% a file

% The second part is to read the file and plot it.

#file_name = 'sampleBM_N25600.txt';
file_name = 'sampleBM_N2000.txt';
# N: Number of time-points for the sample
# should change this N according to the file name to sample
N = 2000; 




%% sampling Brownian motion 
%% Uncomment this block to sample BM
%  
%  BrM = zeros(1,N+1);
%  displacement = randn(1,N)/sqrt(N);
%  BrM(2:N+1) = cumsum(displacement);
%  T = 0:1/N:1;
%  plot(T + BrM*1i)
%  axis equal;
%  hold on
%  
%  fid = fopen(file_name,'w');
%  fprintf(fid,'%2.10f %2.10f\n',[T; BrM]);
%  fclose(fid);

% sampling_view
%% Uncoment this block to view the sample.
  fid = fopen(file_name);
  A = fscanf(fid, '%f %f', [2 inf]);
  % [2 inf] is the size of matrix A
  
  T = A(1,:);
  BM = A(2,:);
  fclose(fid);
  figure('Name', 'Brownian motion sample')
  plot(T + BM*1i)
  axis equal;
  hold on
