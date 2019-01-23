% append two .mat files
% technical file

% these two .mat files appear since we divide the calculation into
% two steps: kappa in [0,4] and in [4,8]


clear all;
load('kappa2.mat','K');
K1 = K;
clear K;
load('kappa1.mat','K');

K = [K1'; K']';
save('kappa3.mat','K');
clear all;

clear all;

clear all;
load('SLE2.mat', 'X','Y');
Xm = X;
Ym = Y;

load('SLE1.mat', 'X','Y');

X = [Xm'; X']';
Y = [Ym'; Y']';

save('SLE3.mat','X','Y');
