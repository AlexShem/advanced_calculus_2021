%%
g = 9.81;
L = 10;
omega = sqrt(g/L);

z_0 = [pi/6; .1];
T = 10;
tspan = linspace(0, T, 101);

[t, z] = ode45(@(t, z) pendulum_system(t, z, omega), tspan, z_0);
theta = z(:, 1);

%%
figure(1);
comet(t, theta);

%%
x_pos = sin(theta);
y_pos = -cos(theta);

figure(2);
for k = 1 : length(t)
    plot(L*x_pos(k), L*y_pos(k), 'ok', 'MarkerFaceColor', 'k');
    hold on;
    line([0 L*x_pos(k)], [0 L*y_pos(k)], 'Color', 'k');
    hold off;
    title(['Time = ' num2str(t(k))]);
    axis equal;
    axis([-L, L, -L, L]);
    drawnow;
end