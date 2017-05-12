clc;
clear all;
close all;
Num = 1000;
% Estimating mean and variance using simple Monte Carlo and Stratified
% Sampling
fun = @(x1,x2)exp(5.*abs(x1-5) + 5.*abs(x2-5));
a = -1;
b = 1;
u1 = rand(1,Num);
u2 = rand(1,Num);
X =fun(u1,u2);
display('Mean and Variance using simple Monte Carlo');
disp(mean());
disp(2*std(X)/sqrt(Num));
K = 20;
Nij = Num/K;
for i = 1:K
for j = 1:K
XS = fun((i-1+rand(1,Nij))/K,(j-1+rand(1,Nij))/K);
XSb(i,j) = mean(XS);
SS(i,j) = var(XS);
end
end
SST = mean(mean(SS/Num));
display('Mean and Variance using Stratified Sampling');
disp(mean(mean(XSb)));
disp(2*sqrt(SST));
% Estimating mean and variance using Importance
% Sampling
e = exp(1); % Importance sampling
u3 = rand(1,Num);
u4 = rand(1,Num);
X1 = log(1+(e-1)*u3);
X2 = log(1+(e-1)*u4);
T = (e-1)^2*exp(5.*abs(X1-5) + 5.*abs(X2-5)-(X1+X2));
display('Mean and Variance using Importance Sampling');
disp(mean(T));
disp(2*std(T)/sqrt(Num));
pl = 0;
pu = 1;
ql = 0;
qu = 1;
fun = @(p,q) exp(5.*abs(p-5) + 5.*abs(q-5)); % theoretical integration of funtion(x,y)
c = integral2 (@(p,q)fun(p,q),pl,pu,ql,qu);
disp('Theoretical integral value');
disp(c);
Num = 1000;
a = -1;
b = 1;
X12 = rand(1,Num); X22=rand(1,Num);
V=(b-a)*(b-a)*cos(pi + 5*(a + (b-a)*X12) + 5*(a + (b-a)*X22));
display('Mean and Variance using simple Monte Carlo');
disp(mean(V));
disp(2*std(V)/sqrt(Num));
g = @(x1,x2)cos(pi + 5.*x1 + 5.*x2);
K = 20; Nij = N/K; % With Stratified sampling
for i = 1:K
for j = 1:K
r1 = (b-a).*rand(1,Nij) + a;
r2 = (b-a).*rand(1,Nij) + a;
XS = g((i-1+r1)/K,(j-1+r2)/K);
XSb(i,j) = mean(XS);
SS(i,j) = var(XS);
end
end
SST = mean(mean(SS/N));
display('Mean and Variance using Stratified Sampling');
disp(mean(mean(XSb)));
disp(2*sqrt(SST));
% Estimating mean and variance using Importance
% Sampling
e = exp(1); % Importance sampling
r3 = (b-a).*rand(1,Nij) + a;
r4 = (b-a).*rand(1,Nij) + a;
X12 = log(1+(e-1)*r3);
X22 = log(1+(e-1)*r4);
T = (e-1)^2*cos(pi + 5.*X12 + 5.*X22-(X12+X22));
display('Mean and Variance using Importance Sampling');
disp(mean(T));
disp(2*std(T)/sqrt(N));
pl = -1;
pu = 1;
ql = -1;
qu = 1;
fun = @(p,q) cos(pi + 5*p + 5*q); % theoretical integration of funtion(x,y)
c = integral2 (@(p,q)fun(p,q),pl,pu,ql,qu);
disp('Theoretical integral value');
disp(c);