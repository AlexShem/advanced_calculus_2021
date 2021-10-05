c = .1;
x_0 = logspace(-1.5, 0.8, 35);
T = 2;
tspan = [0, T];

figure(2);
for k = 1 : length(x_0)
    [t, x] = ode45(@(t, x) x - x.^2 - c, tspan, x_0(k));
    plot(t, x, '-b');
    hold on;
end
hold off;

x_star = roots([-1 1 -c]);
for k = 1 : length(x_star)
    if isreal(x_star(k))
        line([0, T], [x_star(k), x_star(k)], 'linestyle', '--', 'color', 'red');
    end
end
axis([0 T 0 min(1, max(x_0))])
title(['c = ' num2str(c)]);
