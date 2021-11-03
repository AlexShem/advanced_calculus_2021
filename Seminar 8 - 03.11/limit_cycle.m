eps = -.1;
R = 1;

[x, y] = meshgrid(linspace(-2, 2, 101));
r = sqrt(x.^2 + y.^2);
phi = linspace(0, 2*pi);

dx = y + eps*x.*(R - r);
dy = -x + eps*y.*(R - r);

figure(1);
streamslice(x, y, dx, dy)
xlabel('x');
ylabel('y');
hold on;
plot(R*cos(phi), R*sin(phi), '-r', 'LineWidth', 1.5);
hold off;
axis equal;


z_0 = [0, 1.1;
    0, 2;
    0, .9;
    0, .5];
% z_0 = [0, 1.1];
tspan = [0, 2*pi];

figure(2)
for k = 1 : size(z_0, 1)
    [t, z] = ode45(@(t, z) cycle_syst(t, z, eps, R), tspan, z_0(k, :));
    plot(z(:, 1), z(:, 2)); hold on;
end
plot(z_0(:, 1), z_0(:, 2), '*r');
plot(R*cos(phi), R*sin(phi), '-r', 'LineWidth', 2);
hold off;
axis equal;
axis([-3 3 -3 3]);
