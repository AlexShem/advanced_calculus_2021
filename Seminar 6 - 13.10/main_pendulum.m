%%
g = 9.81;
L = 10;
omega = sqrt(g/L);

z_0 = [pi/6; .1];
T = 10;
tspan = linspace(0, T, 101);

[t, z] = ode45(@(t, z) pendulum_system(t, z, omega), tspan, z_0);
theta = z(:, 1);

