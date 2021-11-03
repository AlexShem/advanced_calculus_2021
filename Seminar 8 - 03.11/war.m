a = 1;
b = 1;
alpha = .2;
beta = 5;

A = [alpha, -a; -b, beta];
[V, D] = eig(A)

[x, y] = meshgrid(linspace(0, 3));
dx = alpha*x - a*y;
dy = -b*x + beta*y;

figure(3);
streamslice(x, y, dx, dy);
xlabel('x');
ylabel('y');
hold on;
line([0, -V(1, 1)], [0, -V(2, 1)], 'Color', 'red', 'LineWidth', 2)
