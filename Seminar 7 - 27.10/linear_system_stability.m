a = 1;
b = -2;
A = [a 1; 1 b];
[Va, Da] = eig(A)

[x, y] = meshgrid(linspace(-1, 1, 101));
dx = A(1, 1)*x + A(1, 2)*y;
dy = A(2, 1)*x + A(2, 2)*y;

f1 = figure(1);
streamslice(x, y, dx, dy);
axis([-1 1 -1 1]);
axis equal;
for k = 1 : size(V, 2)
    line([0, Va(1, k)], [0, Va(2, k)], 'Color', 'red', 'LineWidth', 1.5);
end


a = -1;
b = 1;
B = [0 a; b 0];
dx = B(1, 1)*x + B(1, 2)*y;
dy = B(2, 1)*x + B(2, 2)*y;
[Vb, Db] = eig(B)

f2 = figure(2);
streamslice(x, y, dx, dy);
axis([-1 1 -1 1]);
axis equal;


[x, y] = meshgrid(linspace(-2, 2, 101));
dx = exp(x.^2 - x) - 1;
dy = x - y;
f3 = figure(3);
streamslice(x, y, dx, dy);
axis([-2 2 -2 2]);
axis equal;
