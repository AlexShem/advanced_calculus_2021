f_fun = @(x) (pi - mod(x, 2*pi)) / 2;

x = linspace(0, 6*pi - 1e-6, 5001);
f = f_fun(x);

n = 20;
f_ser = 0;
df_ser = 0;
d2f_ser = 0;
for k = 1 : n
    f_ser = f_ser + sin(k*x)/k;
    df_ser = df_ser + cos(k*x);
    d2f_ser = d2f_ser - k*sin(k*x);
end

figure(2)
plot(x, f);
hold on;
plot(x, f_ser);
hold off;

figure(3);
plot(x, df_ser)
line([min(x), max(x)], [-.5, -.5], 'Color', 'red')

figure(4);
plot(x, d2f_ser)
line([min(x), max(x)], [0, 0], 'Color', 'red')
