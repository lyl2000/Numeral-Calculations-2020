% µÚ2ÕÂµÚ4Ìâ
f = @(x)(5*x - exp(x));
g = @(x)(5 - exp(x));
tol = 1e-4; x0 = 0; x1 = 1; n0 = 30;
% [iter1, p1] = Bisection(f, x0, x1, tol, n0);
% [iter2, p2] = Newton(f, g, x0, tol, n0);
% [iter3, p3] = Secant(f, x0, x1, tol, n0);
[iter4, p4] = FalsePosition(f, x0, x1, tol, n0);