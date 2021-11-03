function dz = cycle_syst(t, z, eps, R)
dz = zeros(2, 1);
r = sqrt(z(1)^2 + z(2)^2);

dz(1) = z(2) + eps * z(1) * (R - r);
dz(2) = -z(1) + eps * z(2) * (R - r);
