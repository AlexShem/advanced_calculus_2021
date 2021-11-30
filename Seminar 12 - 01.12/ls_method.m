rng(100);
n = 200;
x_val = normrnd(0, 3, 1, n);
x_val = sort(x_val);

f_link = @(x) 2 + 1.5*x; % a = 2; b = 1.5
f_b = {@(x) 1, @(x) x};

f_link = @(x) 1 + 2*x - .1*x.^2 + 3*sin(x);
f_b = {@(x) 1, @(x) x, @(x) x.^2, @(x) sin(x)};
par_true = [1; 2; -.1; 3];

y_val = f_link(x_val) + normrnd(0, 1, 1, n);
n_par = length(f_b);
%%
A = zeros(n_par);
b = zeros(n_par, 1);
for k = 1 : n_par
    for j = 1 : n_par
        A(k, j) = sum(arrayfun(@(x) f_b{j}(x) .* f_b{k}(x), x_val));
    end
    b(k) = sum(y_val .* arrayfun(f_b{k}, x_val));
end

par = linsolve(A, b);
table(f_b.', par_true, par, abs(par_true - par),...
    'VariableNames', {'Predictor', 'Parameter, P', 'Estimation, E', '|P - E|'})

%%
x = linspace(min(x_val), max(x_val));
y_est = zeros(size(x));
for k = 1 : n_par
    y_est = y_est + par(k) * arrayfun(f_b{k}, x);
end

figure(1)
scatter(x_val, y_val, 'fill');
hold on;
plot(x, y_est, 'LineWidth', 2);
hold off;
%%
X = [ones(n, 1), x_val.', x_val.^2.', sin(x_val.')];
% par = (X'*X)^-1 * X' * y_val.'
par_quick = X \ y_val.'
