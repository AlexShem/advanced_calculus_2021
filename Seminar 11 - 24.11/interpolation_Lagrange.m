x_val = [-9, -4, -1, 7];
y_val = [5, 2, -2, 9];

n = length(x_val);

L_i = @(x, i) prod(...
    (x - x_val([1:(i-1), (i+1):end])) ./ ...
    (x_val(i) - x_val([1:(i-1), (i+1):end])),...
    2);

x = linspace(min(x_val), max(x_val)).';
y = zeros(size(x));

figure(1);
for i = 1 : n
    y_i = y_val(i) * L_i(x, i);
    y = y + y_i;
    pl = plot(x, y_i); hold on;
    sc = scatter(x_val(i), y_val(i), 60, 'LineWidth', 1, ...
        'MarkerFaceColor', pl.Color, 'MarkerEdgeColor', 'none');
    sc.HandleVisibility = 'off'; % Don't show the scatter points in (future) legend
end
plot(x, y, '--k', 'LineWidth', 1.5);
hold off;
legend('L_1', 'L_2', 'L_3', 'L_4', 'L')
