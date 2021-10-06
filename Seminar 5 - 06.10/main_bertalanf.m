alpha = 1;
beta = 1;

V_0 = [2.2, .25, .05];
T = 10;
tspan = [0, T];

figure(1);
for k = 1 : length(V_0)
    [t, V] = ode45(@(t, y) alpha*y^(2/3) - beta*y, tspan, V_0(k));
    plot(t, V)
    hold on;
end
hold off;
[t, V] = ode45(@(t, y) alpha*y.^(2/3) - beta*y, tspan, V_0);
plot(t, V)
grid on;
xlabel('t');
ylabel('V');
axis([0 T 0 2.5]);
tl = title('$\dot{V} = \alpha V^{2/3} - \beta V$', 'Interpreter', 'latex');
tl.FontSize = 14;
subtitle(['\alpha = ' num2str(alpha), ', \beta = ', num2str(beta)]);
