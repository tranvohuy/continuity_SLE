

file_name = 'gammas_at1.txt';
#file structure: kappa, gamma real part, gamma imag part
 
fid = fopen(file_name);
A = fscanf(fid, '%f %f %f', [3 inf]);
kappa = A(1,:);
real_gamma = A(2,:);
imag_gamma = A(3,:);


#view real & imag parts w.r.t. kappa
#it is expected that, for kappa =0, gamma(1) is at 2*i

f1 = figure('Name','Separate Real and Imaginary w.r.t Kappa', 'Numbertitle','off');
hold on
plot(kappa, real_gamma,'r');
plot(kappa, imag_gamma,'k');
legend('Real part', 'Imaginary part');
xlabel('Kappa')
axis equal;


#in 3d
%f2 = figure('Name', 'Gamma 

#movement of the position w.r.t kappa

