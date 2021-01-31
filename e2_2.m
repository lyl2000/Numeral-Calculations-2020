% µÚ2ÕÂµÚ2Ìâ
f = @(x)(2 - 3*x - sin(x));
a = 0; b = 1; tol = 0.0005; N = 30;
[iter, p] = Bisection(f, a, b, tol, N);