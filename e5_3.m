% ตฺ5ีย ตฺ3ฬโ
f = @(t, y)((t - y) / 2);
a = 0; b = 3; alpha = 1;
for h = [1, 0.5, 0.25, 0.125]
    [t, w] = AdamsFourthOrderPredictorCorrector(a, b, (b - a) / h, alpha, f);
    scatter(t, w);
    hold on;
end
s = @(t)(t + 3*exp(-t/2) - 2);
t = a:0.01:b;
w = s(t);
plot(t, w);
xlabel("x");
ylabel("y");
legend('1', '0.5', '0.25', '0.125', 'y(x)', 'Location', 'NorthWest');