function P = hermite_interp(x, a, b, vals)
Pa = vals(1);
dPa = vals(2);
Pb= vals(3);
dPb = vals(4);
h = b-a;

P = dPa*(x-a).*(x-b).^2/h^2 + Pa*(2*(x-a).*(x-b).^2/h^3 + (x-b).^2/h^2) +...
    dPb*(x-a).^2.*(x-b)/h^2 + Pb*(2*(x-a).^2.*(b-x)/h^3 + (x-a).^2/h^2);
