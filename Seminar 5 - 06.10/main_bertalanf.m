alpha = 1;
beta = 1;

V_0 = [2.2, .25, .05];
T = 10;
tspan = linspace(0, T, 100).';

V = zeros(length(tspan), length(V_0));

%%
figure(1);
for k = 1 : length(V_0)
    [~, V(:, k)] = ode45(@(t, y) alpha*y^(2/3) - beta*y, tspan, V_0(k));
    plot(tspan, V(:, k))
    hold on;
end
hold off;
grid on;
xlabel('t');
ylabel('V');
axis([0 T 0 2.5]);
title('$\dot{V} = \alpha V^{2/3} - \beta V$', 'Interpreter', 'latex');
