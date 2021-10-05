c = 1/4;
x_0 = linspace(0, 1, 20);
T = 10;
tspan = linspace(0, T, 100);

x = zeros(length(tspan), length(x_0));
for k = 1 : length(x_0)
    [~, x(:, k)] = ode45(@(t, x) x - x.^2 - c, tspan, x_0(k));
end

figure(2);
plot(tspan, x, '-b');

x_star = roots([-1 1 -c]);


for k = 1 : length(x_star)
    if isreal(x_star(k))
        line([0, T], [x_star(k), x_star(k)], 'linestyle', '--', 'color', 'red');
    end
end
axis([0 T 0 1])
