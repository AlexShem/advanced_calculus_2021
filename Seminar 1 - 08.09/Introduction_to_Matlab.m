%% Введение в Matlab
% Семинар №1,
% 8 сентября 2021г.

%% Контакты
% *Александр Андреевич Шемендюк* , аспирант _Университета Лозанны_
% 
% |email| : alex.shemendyuk@gmail.com
% 
% |Telegram group 1| : <https://t.me/joinchat/7Z-aSaJibahlYTM0>
% 
% |Telegram group 2| : <https://t.me/joinchat/_GwyE8FqVKZlOThk>
% 

%% Установка Матлаба
% 
% Информация по *установке* Матлаба для студентов НИУ ВШЭ доступна по ссылке:
% <https://www.hse.ru/ma/finmarket/blackboard/379023917.html>
% 
% *Шпаргалки* (CheatSheats) по Матлабу: 
% <https://hub.exponenta.ru/post/shpargalka-po-bazovym-funktsiyam-matlab414 на русском>, 
% <https://www.mathworks.com/matlabcentral/fileexchange/47533-cheatsheet-pdf на английском>.

%% Запуск и настройка
% Настройки Матлаба досупны в разделе Preferences.
% 
% <<../Figures/fig1_preferences_find.PNG>>
% 
% Самые практичные разделы: 
% 
% # *Display* : для удобного отображения окна с кодом
% # *Fonts* : для изменение размера шрифта
% 
% <<../Figures/fig2_preferences_suggested.PNG>>
% 
%% Переменные и операции над ними
% Создадим две переменные и проведем некоторые операции над ними.
a = 2; % Этот знак используется для комментариев
b = pi; % Число $\pi$

a + b
b/a
sqrt(a)
disp(a^5)

%%
% Используйте команду |clear| , чтобы удалить все переменные из рабочего
% пространства ( _Workspace_ ).
whos    % Отобразяться все доступные переменные
clear   % или можно: clear all
whos    % Переменных больше нет, отображаться нечему

%% 
% Команда |clc| очищает коммандное окно ( _Command Window_ )
clc

%% Комплексные числа
% *Инициализация* комплексных чисел
z_1 = complex(2, 3) % Re(z_1) = 2, Im(z_1) = 3
z_2 = 3 + 4i
z_3 = 2*exp(1i * pi/3)

%%
% *Модуль* и *аргумент* комплексного числа

% num2str(z) -- трансформирует число z в формат "строка"
disp(['Модуль z_3: ' num2str(abs(z_3))])
disp(['Аргумент z_3: ' num2str(angle(z_3))])
disp(['pi/3 = ' num2str(pi/3)])

%% График многочлена
% Пусть задан многочлен степени $n$
% 
% $$P_n(x) = p_n x^n + p_{n-1} x^{n-1} + \ldots + p_1 x + p_0,$$
% 
% где $a_1 \neq 0$, см.
% <https://www.mathworks.com/help/releases/R2020b/matlab/math/create-and-evaluate-polynomials.html создание и вычисление многочленов>.
% Необходимо построить его график на заднном сегменте $X \subset R$.
% 
% Рассмотрим $P_3(x) = 3 x^3 + 2 x^2 + x$ на отрезке $X = [-1, 1.5]$. Для
% этого создадим равномерную сетку |х| (т.е. с постоянным шагом) от -1 до
% 1.5 используя
% <https://www.mathworks.com/help/releases/R2020b/matlab/ref/linspace.html
% linspace>, и вычислим значения многочлена в каждой из этих точек с
% помощью <https://www.mathworks.com/help/releases/R2020b/matlab/ref/polyval.html polyval>.

p = [3 -2 -1 0];                % задаем коэффициенты многочлена
x = linspace(-1, 1.5, 101);     % linspace(from, to, num_of_points)
P = polyval(p, x);              % polyval(polynomial, at_what_points)

figure(1);      % Открываем окно, в котором будем рисовать график
plot(x, P);     % Рисуем линию
xlabel('x');    % Подпись к оси ОХ
legend('P_3(x) = 3 x^3 + 2 x^2 + x'); % Добавляем легенду

%%
% *Замечание:* коэффициенты многочлена могут быть комплексные. Найдем корни
% многочлена $P_2(z) = z^2 -2i z + 3$ с помощью функции 
% <https://www.mathworks.com/help/releases/R2020b/matlab/ref/roots.html roots>.
p = [1 -2i 3];
z = roots(p)
sum(z)  % Сумма всех элементов
prod(z) % Произведение всех элементов

%% График произвольной функции
% Требуется построить график заданной функции $f(x)$ (пусть она непрерывна на
% множестве $X$).
% 
% В таких случаях мы таким же образом создаем сетку на множестве $X$ и
% вычисляем значения функции $f(x)$ в этих точках.
%
% Рассмотрим функцию $f(x) = 1 - x^2$ на отрезке $[-1, 1]$.

x = linspace(-1, 1, 101);
f = 1 - x.^2;

figure(2);
plot(x, f);
xlabel('x'); ylabel('y');
legend('f(x) = 1 - x^2');

%% Числа Фибоначчи
% *Числа Фибоначчи* задаются реккурентным соотношением
% 
% $$x_{n+1} = x_n + x_{n-1}$$
% 
% и начальными условиями $x_0 = 1, \, x_1 = 1$ для $n = 0, 1, 2, \ldots$.
% 
% Построим график для первых 10 её членов.

n = 10;
x = nan(n, 1);      % Вектор столбец размера n, заполненный NaN (Not a Number)
x(1) = 1; x(2) = 1;
x(1:2) = 1;         % Аналогичный вариант присваивания

% Считаем 3, 4, ... члены последовательности по очереди
for i = 3 : n
    x(i) = x(i-1) + x(i-2);
end

figure(3);
plot(0:n-1, x, '-s');
grid on;                    % Добавим сетку на графике
xlabel('n');
legend('x(n)');
title('Числа Фибоначчи');   % Добавим заголовок к графику

%%
% Решение такого уравнения есть
% 
% $$x_n = A_1 \lambda_1^n + A_2 \lambda_2^n,$$
% 
% или же
% 
% $$x_n = \frac{5-\sqrt{5}}{10} \, \left(\frac{1 - \sqrt{5}}{2}\right)^n + \frac{5+\sqrt{5}}{10} \, \left(\frac{1 + \sqrt{5}}{2}\right)^n$$
% 
% Добавим на график эти два слагаемых

lam1 = .5*(1 - sqrt(5));
lam2 = .5*(1 + sqrt(5));
A1 = (5 - sqrt(5))/10;
A2 = (5 + sqrt(5))/10;

figure(4);
plot(0:n-1, x, '-s');
grid on;        % Добавим сетку на графике
xlabel('n');
hold on;        % Зафиксируем линии, которые уже построены
plot(0:n-1, A1*lam1.^(0:n-1), '--s');
plot(0:n-1, A2*lam2.^(0:n-1), '--s');
hold off;       % Уберем фиксацию
legend('x(n)', 'A_1 \lambda_1^n', 'A_2 \lambda_2^n');
title('Числа Фибоначчи');

