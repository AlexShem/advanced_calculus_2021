function [a_root, x, iter] = heron_method(a, x_0)
iter_max = 20;
eps = 10^-6;

x = NaN(iter_max + 1, 1);
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

x = x(~isnan(x));
a_root = x(end);
end
