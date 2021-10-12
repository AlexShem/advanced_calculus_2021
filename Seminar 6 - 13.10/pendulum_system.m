function dz = pendulum_system(t, z, omega)

dz = [z(2); -omega^2 * sin(z(1))];
