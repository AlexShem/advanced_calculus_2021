%%
N = 5;
a = 0;
b = pi;

% xval = linspace(0, pi, N+1);
% rng(1);
xval = [a, sort(unifrnd(a, b, 1, N-1)), b];
yval = sin(xval);

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
x = linspace(a, b, 3001);
S = zeros(size(x));
for k = 1 : N
    if k == N
        ind = x >= xval(k) & x <= xval(k+1);
        xx = x(x >= xval(k) & x <= xval(k+1));
    else
        ind = x >= xval(k) & x < xval(k+1);
        xx = x(x >= xval(k) & x < xval(k+1));
    end
    S(ind) = hermite_interp(xx, xval(k), xval(k+1), [yval(k), m(k), yval(k+1), m(k+1)]);
end

%% Visualisation
figure(1);
scatter(xval, yval, 'fill');
hold on;
plot(x, S);
hold off;

%% Spline MATLAB
S_m = spline(xval, [1, yval, -1], x);
% S_m = spline(xval, yval, x);
figure(1);
hold on;
plot(x, S_m, ':k');
hold off;
legend('Data', 'Custom Spline', 'Matlab Spline', 'FontSize', 14)
