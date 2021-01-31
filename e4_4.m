% ตฺ4ีย ตฺ4ฬโ
a = 1; b = 6; hs = [0.5, 0.25, 0.125];
f = @(x)(2 + sin(2 * sqrt(x)));
I1 = zeros(3, 1); I2 = zeros(3, 1);
s = @(x)(2*x + sin(2*x^(1/2))/2 + x^(1/2)*(2*sin(x^(1/2))^2 - 1));
I = s(b) - s(a);
for i = 1:3
    h = hs(i);
    n = (b - a) / h;
    I1(i) = CompositeTrapezoidal(a, b, n, f);
    I2(i) = CompositeSimpson(a, b, n, f);
end