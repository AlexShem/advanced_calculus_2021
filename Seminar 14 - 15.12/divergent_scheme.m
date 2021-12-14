%% Function in ODE
% dx[r(x) * dx u] + q(x)*u = g(x)
r = @(x) -ones(size(x));
dr = @(x) 0;
q = @(x) x.^2 + 1;
% If u(x) == exp(x/2), then g(x) is
g = @(x) exp(x/2).*(x.^2 + .75);

X = 1;
u0_val = 1;
uX_val = exp(X/2);

N = 6;
h = X/(N-1);
x = linspace(0, X, N);
x_mid = .5*(x(2:end) + x(1:end-1));

r_vec = (r(x_mid(1:end-1)) + r(x_mid(2:end)));
q_vec = q(x(2:end-1));

A = diag([1, -r_vec/h^2 + q_vec, 1]) +...
    diag([r(x_mid(1:end-1)), 0]/h^2, -1) +...
    diag([0, r(x_mid(2:end))]/h^2, 1);
b = g(x).';
b(1) = u0_val;
b(end) = uX_val;

u = A \ b;

x_grid = linspace(0, X, 1001);
figure(1)
plot(x, u);
hold on;
plot(x_grid, exp(x_grid/2), '--r');
hold off;
