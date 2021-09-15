a = 40;

a_root = heron_method(a);
a_root_true = sqrt(a);

abs(a_root - a_root_true)

nsim = 10;
upper_x = a/2;
% rng(1);
x_0 = unifrnd(0, upper_x, nsim, 1);
x_0 = sort(x_0);

a_root = zeros(nsim, 1);
iter_num = zeros(nsim, 1);

ind_draw = randperm(nsim, 8);

figure(1);
for k = 1 : nsim
    [a_root(k), iter_num(k), x_path] = heron_method(a, x_0(k));
    
    if ismember(k, ind_draw)
        plot(0:iter_num(k), x_path);
        hold on;
    end
end
hold off;
line([0, 5], [a_root_true, a_root_true],...
    'color', 'red', 'LineWidth', 2, 'LineStyle', '--');
xlabel('No. of interation');
ylabel('x_0');

figure(2);
plot(x_0, iter_num, '-')
line([a_root_true a_root_true], [0 max(iter_num)],...
    'Color', 'red', 'LineWidth', 2, 'LineStyle', '--')
xlim([0, upper_x]);
ylim([0, max(iter_num)]);
xlabel('x_0');
ylabel('Number of iterations');

