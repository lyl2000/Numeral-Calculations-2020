% µÚ3ÕÂ µÚ2Ìâ
y = @(x)(sin(x));
N = 21; n = 20; x = 0 : pi/N : pi;
f = @(x, x0, a, b, c, d)(a + b * (x - x0) + c * (x - x0) .^ 2 + d * (x - x0) .^ 3);
mode = ["Nature", "Clamped", "Cycle", "Undistorted"];
color = ['g', 'b', 'r', 'k'];
for i = 1 : 4
    [a, b, c, d] = CubicSpline(N, x, y(x), cos(0), cos(pi), mode(i));
    for j = 1 : N
        x1 = x(j) : (x(j+1)-x(j))/n : x(j+1);
        plot(x1, f(x1, x(j), a(j), b(j), c(j), d(j)), color(i));
        hold on;
        scatter(x, y(x), color(i));
    end
end
% hold on;
% plot(0:pi / 1000:pi, y(0:pi / 1000:pi), 'c');