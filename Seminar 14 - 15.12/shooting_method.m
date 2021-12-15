r = @(x) -1;
dr = @(x) 0;
q = @(x) x.^2 + 1;
g = @(x) exp(x/2).*(x.^2 + .75);

X = 1;
u0_val = 1;
uT_val = exp(X/2);

du0 = linspace(0, 1, 21);
figure;
for k = 1 : length(du0)
    u0 = [u0_val, du0(k)];
    [x, U] = ode45(@(x, u) syst_fun(x, u, r, dr, q, g), [0 X], u0);
    plot(x, U(:, 1), '--k'); hold on;
end
scatter(X, uT_val, 'red', 'fill')
% plot(t, exp(t/2), '-r')
hold off;
xlabel('x');

function du = syst_fun(t, u, r, dr, q, g)
du = [u(2);
    (g(t) - dr(t).*u(2) - q(t).*u(1))./r(t)];
end
