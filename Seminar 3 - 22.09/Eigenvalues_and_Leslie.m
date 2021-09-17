%% Собственные числа, вектора, и модель Лесли - Лефковича

%% Собственные числа и вектора
A = [1, -1, 0;
    0, 2, 0;
    0, 0, 3]

%%
eig(A)

%%
[V, D] = eig(A)
%%
A*V
%%
vec = [-1;1;0];
A^4 * vec

%% Лесли: инициализация
m = [20 30 40];
cumsum(m)
(m-1)./m

%%
diag((m-1)./m)
diag(1./m(1:end-1), -1)
diag((m-1)./m) + diag(1./m(1:end-1), -1)

%% Лесли: создание матрицы L
L = diag((m-1)./m) + diag(1./m(1:end-1), -1);
alpha = .05;
beta = .5;
b = .04;

%%%
L(1, 2) = b;
L(1, 1) = L(1, 1) * (1 - alpha);
L(2, 1) = L(2, 1) * (1 - alpha);
L(end, end) = L(end, end) * (1 - beta)

%% Лесли: собственные числа и вектора матрицы L
[V, D] = eig(L)

%% Лесли: симуляция
p_0 = [10; 40; 20];
p_1 = L*p_0

%%
N = 100;
p = zeros(3, N + 1);
p(:, 1) = p_0;

for k = 1 : N
    p(:, k+1) = L * p(:, k);
end

%% Лесли: разложение начального условия по собственным векторам матрицы L
abc = V^-1 * p_0

%%
a = abc(1);
b = abc(2);
c = abc(3);
v1 = V(:, 1);
v2 = V(:, 2);
v3 = V(:, 3);
disp(a*v1 + b*v2 + c*v3);

%% Лесли: анализ
disp(diag(D).^N)

%%
[lam_max, max_ind] = max(diag(D));
p_N_approx = abc(max_ind) * lam_max.^(0:N) .* v2;

%%
disp(p_N_approx(:, end) - p(:, end));

%%
p_size = sum(p);

figure(9);
plot(0:N, p_size, '-', 'LineWidth', 2);
grid on;

hold on;
plot(0:N, sum(p_N_approx), '.r', 'MarkerSize', 6);
plot(0:N, p, '-.')
hold off;

xlabel('n, year');
legend('Population size', 'Population approximation', 'Babies', 'Adults', 'Elderly');
title('Poupulation evolution over time', 'according to Leslie model');
