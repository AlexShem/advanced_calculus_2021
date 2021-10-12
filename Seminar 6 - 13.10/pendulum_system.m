function dz = pendulum_system(t, z, omega)

dz = [z(2); -omega^2 * z(1)]
