% µÚ2ÕÂµÚ3Ìâ
f = @(x)(0.5 + 0.25.*x.^2 - x.*sin(x) - 0.5.*cos(2.*x));
g = @(x)(0.5.*x - sin(x) - x.*cos(x) + sin(2.*x));
p0 = [pi / 2, pi * 5, pi * 10]; tol = 1e-5; N = 14000;
% [iter1, p1] = Newton(f, g, p0(1), tol, N);
% [iter2, p2] = Newton(f, g, p0(2), tol, N);
[iter3, p3] = Newton(f, g, p0(3), tol, N);