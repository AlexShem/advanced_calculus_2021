%% Problem initializtion
pr_No = 2;

switch pr_No
    case 1
        A = [-1, 0, -1;
            1, -2, 0;
            0, 1, -3];
        x_up = pi/2;
        y_up = pi/4;
        z_up = pi/12;
    case 2
        A = [-.01, 0, -1;
            1, -.02, 0;
            0, 1, -3];
        x_up = pi/.02;
        y_up = pi/.0004;
        z_up = pi/.0012;
    otherwise
        error(['Problem number ' num2str(pr_No) ' is undefined.']);
end

S_0 = zeros(3, 1); % Stationary point

%% Characteristic polynomial

P_lam = poly(A);
lam = linspace(-4, 1);
figure(1);
plot(lam, polyval(P_lam, lam))
line([min(lam) max(lam)], [0 0], 'Color', 'red');
xlabel('\lambda');
ylabel('\chi_A(\lambda)');

%% Eigenvalues of A
lam = roots(P_lam);

[x, y, z] = meshgrid(...
    linspace(-x_up, x_up, 101),...
    linspace(-y_up, y_up, 101),...
    linspace(-z_up, z_up, 101));
% dx = -x - atan(z);
% dy = x -2*y;
% dz = y -3*z;

dx = -.01*x - atan(z);
dy = x -.02*y;
dz = y -3*z;

Nstart = 30;
% rng('default');
sx = zeros(Nstart, 1);
sy = normrnd(20, 2, Nstart, 1);
sz = normrnd(6.5, 1, Nstart, 1);

% sx = zeros(Nstart, 1);
% sx = (rand(Nstart, 1) - .5) * 2*x_up;
% sy = (rand(Nstart, 1) - .5) * 2*y_up;
% sz = (rand(Nstart, 1) - .5) * 2*z_up;

% Close to zero
% sx = normrnd(0, 10, Nstart, 1);
% sy = normrnd(0, 10, Nstart, 1);
% sz = normrnd(0, 10, Nstart, 1);
%%
figure(2);
% quiver3(x, y, z, dx, dy, dz);
streamline(stream3(x, y, z, dx, dy, dz, sx, sy, sz));
view(3);
xlabel('x');
ylabel('y');
zlabel('z');
hold on;
plot3(S_0(1), S_0(2), S_0(3), '*r');
plot3(sx, sy, sz, '*g');
hold off;

%% Numerical approach

T = 200;
tau = .01;
tspan = 0:tau:T;

figure(3)
for k = 1 : Nstart
    [t, S] = ode45(@ode_system_2, tspan, [sx(k), sy(k), sz(k)]);
    tl = length(t);
%     plot3(S(:, 1), S(:, 2), S(:, 3), '-k'); hold on;
    plot3(S(round(tl/4):end, 1), S(round(tl/4):end, 2), S(round(tl/4):end, 3), '-k'); hold on;
    plot3(sx(k), sy(k), sz(k), '*g');
end
hold off
xlabel('x');
ylabel('y');
zlabel('z');

%% Poincare method

T = 50;
tau = .01;
tspan = 0:tau:T;


S_p0 = [0, 21, 6.5];
S_poincare = [S_p0 + [0, 1, 0]; S_p0 + [0, 0, 1]];

A_poin = zeros(2);

for k = 1 : 2
    [t, S] = ode45(@ode_system_2, tspan, S_poincare(k, :));
    tl = length(t);
    
    half_ind = find(S(:, 1) > 0, 1);
    S = S(half_ind:end, :);
    
    one_ind = find(S(:, 1) < 0, 1);
    A_poin(:, k) = S_p0(2:3) - S(one_ind, 2:3);
end

eig(A_poin)
