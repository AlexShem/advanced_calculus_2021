function [a_root, iter, x] = heron_method(a, x_0)
% Функция двух аргументов:
%   a: число, из которого будет считаться квадратный корень
%   x_0: начальное приближение
% 
% Возвращаемые значения:
%   a_root: квадратный корень из числа a
%   iter: количество итераций, которое потребовалось алгоритму
%   x: последовательнось x_n


iter_max = 30;  % Максимльное количество итераций алгоритма
eps = 10^-6;    % Точность вычислений

x = NaN(iter_max + 1, 1);   % Вектор для последовательности x_0
x(1) = x_0;

x(2) = 1/2 * (x(1) + a/x(1));
iter = 1;

while abs(x(iter + 1) - x(iter)) > eps
    iter = iter + 1;
    if iter > iter_max
        error('Method did not converge.');
    end
    x(iter + 1) = 1/2 * (x(iter) + a/x(iter));
end

x = x(~isnan(x));   % Удаляем пустые элементы в векторе x
a_root = x(end);    % Корень из числа a есть последнее значение в векторе x
end
