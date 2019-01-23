% view SLE
% view data pre-computed by 'continuity_of_tip_in_kappa.m'


% there are several ways to view curves.

% 
% First way. Plot in 3d and interpolate nicely between kappa
clear all;
load('kappa3.mat','K');
load('SLE3.mat','X','Y');
%each columns of X and Y is for different kappa

[nt nk] = size(X); #number of different times and kappa

h = surf(K, X, Y);

set(h, 'edgecolor','none')

hold on
axis equal
xlabel('Kappa');
ylabel('Real part');
zlabel('Imag part');



% Second way. Plot in 3d and don't interpolate
figure(2);
hold on


for i = 1:nk
  plot3(K(:,i), X(:,i), Y(:,i));
endfor
view(3)
axis equal
xlabel('Kappa');
ylabel('Real part');
zlabel('Imag part');
%


%Third way. See the changes/trajectories of some gamma(t_i) w.r.t kappa
figure(3);
hold on
T = floor([0 0.5 0.2 0.7 0.9] * nt) +1
for i =1:length(T)
  plot3(K(T(i),:),X(T(i),:),Y(T(i),:));
end

%plot3(K(100,:),X(100,:),Y(100,:));
%plot3(K(200,:),X(200,:),Y(200,:));
%plot3(K(300,:),X(300,:),Y(300,:));
view(3);
axis equal
xlabel('Kappa');
ylabel('Real part');
zlabel('Imag part');
