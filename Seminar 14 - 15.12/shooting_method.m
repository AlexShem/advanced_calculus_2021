r = @(x) -1;
dr = @(x) 0;
q = @(x) x.^2 + 1;
g = @(x) exp(x/2).*(x.^2 + .75);

T = 1;
u0_val = 1;
uT_val = exp(T/2);

du = linspace(0, 1, 21);
figure;
for k = 1 : length(du)
    u0 = [u0_val, du(k)];
    [t, U] = ode45(@(t, u) syst_fun(t, u, r, dr, q, g), [0 T], u0);
    plot(t, U(:, 1), '--k'); hold on;
end
scatter(T, uT_val, 'red', 'fill')
% plot(t, exp(t/2), '-r')
hold off;

function du = syst_fun(t, u, r, dr, q, g)
du = [u(2);
    (g(t) - dr(t).*u(2) - q(t).*u(1))./r(t)];
end
