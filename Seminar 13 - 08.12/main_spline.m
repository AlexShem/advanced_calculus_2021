%%
N = 5;
% xval = linspace(0, pi, N+1);
% rng(1);
xval = [0, sort(unifrnd(0, pi, 1, N-1)), pi];
yval = sin(xval);

x = linspace(0, pi, 1001);

h = diff(xval);
lam = h(2:end) ./ (h(1:end-1) + h(2:end));
mu = 1 - lam;
C = 3*lam.*(yval(2:end-1) - yval(1:end-2))./h(1:end-1) +...
    3*mu.*(yval(3:end) - yval(2:end-1))./h(2:end);

A = 2*eye(N+1) + diag([0, mu].*ones(1, N), 1) + diag([lam, 0].*ones(1, N), -1);

%% Border conditions
A(1, 2) = 0; A(end, end-1) = 0;
A(1, 1) = 1; A(end, end) = 1;
C = [1; C.'; -1];

%% Spline
m = A \ C;
P = 0;
for k = 1 : N
    if k == N
        xx = x(x >= xval(k) & x <= xval(k+1));
    else
        xx = x(x >= xval(k) & x < xval(k+1));
    end
    p = hermite_interp(xx, xval(k), xval(k+1), [yval(k), m(k), yval(k+1), m(k+1)]);
    P = [P, p];
end
P = P(2:end);

%% Visualisation
figure(1);
scatter(xval, yval, 'fill');
hold on;
plot(x, P);
hold off;

%% Spline MATLAB
s = spline(xval, [1, yval, -1], x);
% s = spline(xval, yval, x);
figure(1);
hold on;
plot(x, s, ':k');
hold off;
legend('Data', 'Custom Spline', 'Matlab Spline')
