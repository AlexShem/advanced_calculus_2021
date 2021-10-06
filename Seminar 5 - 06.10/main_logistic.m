c = .23;
x_0 = logspace(-1.5, 0.8, 35);
T = 2;
tspan = [0, T];

figure(2);
[t, x] = ode45(@(t, x) x - x.^2 - c, tspan, x_0);
plot(t, x, '-k');

x_star = roots([-1 1 -c]);
for k = 1 : length(x_star)
    if isreal(x_star(k))
        line([0, T], [x_star(k), x_star(k)], ...
            'Linestyle', '--', 'Color', 'red', 'LineWidth', 1.6);
    end
end
axis([0, T, 0, min(1, max(x_0))])
tl = title('$\dot{x} = x - x^2 - c$', 'Interpreter', 'latex');
tl.FontSize = 14;
subtitle(['$c = $' num2str(c)], 'Interpreter', 'latex');
xlabel('$t$', 'Interpreter', 'latex', 'FontSize', 16);
ylabel('$x$', 'Interpreter', 'latex', 'FontSize', 16)
