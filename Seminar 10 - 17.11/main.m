%%
A = [-1, 0, -1;
    1, -2, 0;
    0, 1, -3];
char_p = -poly(A);

lam = linspace(-5, 1);
figure(1);
plot(lam, polyval(char_p, lam));
line([min(lam), max(lam)], [0, 0], 'Color', 'red');
xlabel('\lambda');
ylabel('\chi_A(\lambda)');

roots(char_p)
eig(A)

x_up = pi/2;
y_up = pi/4;
z_up = pi/12;

[x, y, z] = meshgrid(...,
    linspace(-x_up, x_up),...
    linspace(-y_up, y_up),...
    linspace(-z_up, z_up));
dx = -x - atan(z);
dy = x - 2*y;
dz = y - 3*z;

Nstart = 10;
rng(1);
sx = (rand(Nstart, 1) - 0.5) * 2 * x_up;
sy = (rand(Nstart, 1) - 0.5) * 2 * y_up;
sz = (rand(Nstart, 1) - 0.5) * 2 * z_up;

figure(2);
streamline(stream3(x, y, z, dx, dy, dz, sx, sy, sz));
hold on;
plot3(0, 0, 0, '*r');
plot3(sx, sy, sz, '*g');
hold off;
view(3);
xlabel('x');
ylabel('y');
zlabel('z');

%%
A = [-.01, 0, -1;
    1, -.02, 0;
    0, 1, -3];
eig(A)

T = 200;
tau = .05;
tspan = 0 : tau : T;

x_up = pi/.02;
y_up = pi/.0004;
z_up = pi/.0012;

Nstart = 10;
rng(1);
% sx = (rand(Nstart, 1) - 0.5) * 2 * x_up;
% sy = (rand(Nstart, 1) - 0.5) * 2 * y_up;
% sz = (rand(Nstart, 1) - 0.5) * 2 * z_up;
sx = normrnd(0, 10, Nstart, 1);
sy = normrnd(0, 10, Nstart, 1);
sz = normrnd(0, 10, Nstart, 1);

figure(3);
for k = 1 : Nstart
    [t, S] = ode45(@ode_system, tspan, [sx(k), sy(k), sz(k)]);
    plot3(S(:, 1), S(:, 2), S(:, 3), '-k'); hold on;
end
plot3(0, 0, 0, '*r');
plot3(sx, sy, sz, '*g');
view(3);
xlabel('x');
ylabel('y');
zlabel('z');
hold off;
