% µÚ2ÕÂµÚ1Ìâ
iter = 45;
x1 = zeros(iter, 1);
x2 = zeros(iter, 1);
x3 = zeros(iter, 1);
x1(1) = 2;
x2(1) = 2;
x3(1) = 2;
for i = 2:iter
    x1(i) = 15 - x1(i-1)^2;
    x2(i) = 15 / (2 * x2(i-1) + 1);
    x3(i) = x3(i-1) - (2*x3(i-1)^2+x3(i-1)-15) / (4*x3(i-1)+1);
end

plot(1:iter, x1, 'r');
hold on;
plot(1:iter, x2, 'g');
hold on;
plot(1:iter, x3, 'b');
xlabel("iteration");
ylabel("x");
legend('15-x^2', '15/(2*x+1)', 'x-(2*x^2+x-15)/(4*x+1)');