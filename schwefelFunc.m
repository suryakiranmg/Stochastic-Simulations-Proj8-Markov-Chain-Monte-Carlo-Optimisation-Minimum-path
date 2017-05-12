function schwefelFunc(N)
%% Contour Plotting
x1 = linspace(-500,500); % Generate a row vector of 100 linearly equally spaced points between -512 and 512
x2 = linspace(-500,500); % Generate a row vector of 100 linearly equally spaced points between -512 and 512
[X1,X2] = meshgrid(x1,x2);  % Obtain 100x100 pairs of points in matrix form from vectors x and y
Z = 418.9829*2 - X1.*sin(sqrt(abs(X1))) - X2.*sin(sqrt(abs(X2))); % Compute f(x,y) in matrix form

figure(1)
contour(X1,X2,Z); % Plot a contour plot
title('Contour plot of 2D Schwefel Surface')
colorbar;
xlabel('X1');
ylabel('X2');
figure(2)
mesh(X1,X2,Z); % Plot a mesh plot
title('Mesh plot')
colorbar;
xlabel('X1');
ylabel('X2');
zlabel('Z');
xlim([-500 500]);
ylim([-500 500]);

%% Eggholder Function(Simulated Annealing)
XArray = zeros(N);
YArray = zeros(N);
T = zeros(N);
T = 100;
XDashArray = zeros(N);
YDashArray = zeros(N);

for t = 1:N
    XDashArray(t + 1) = XArray(t) + normrnd(0,10);
    YDashArray(t + 1) = YArray(t) + normrnd(0,10);
    
    Z1 = 418.9829*2 - XDashArray(t+1).*sin(sqrt(abs(XDashArray(t+1)))) - YDashArray(t+1).*sin(sqrt(abs(YDashArray(t+1))));
    Z2 = 418.9829*2 - XArray(t).*sin(sqrt(abs(XArray(t)))) - YArray(t).*sin(sqrt(abs(YArray(t))));
    
    alpha = exp(Z2 - Z1)/T(t);
    
    if((Z1 <= Z2) || (rand(1) < alpha))
        XArray(t+1) = XDashArray(t+1);
        YArray(t+1) = YDashArray(t+1);
        
    else
        XArray(t+1) = XArray(t);
        YArray(t+1) = YArray(t);
    end
    T(t+1) = 100/log(t+1);
end
display('The minimum values of X* and Y* are:');
display(XDashArray(N));
display(YDashArray(N));
display('The minimum values of the surface is:');
display(418.9829*2 - XDashArray(N).*sin(sqrt(abs(XDashArray(N)))) - YDashArray(N).*sin(sqrt(abs(YDashArray(N)))));
end