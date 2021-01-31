% ��4�� ��3��
f = @(x)(exp(-x^2 / 2));
a = 0; b = 1; h = 0.01; n = (b - a) / h;
I1 = CompositeTrapezoidal(a, b, n, f) / sqrt(2 * pi);  % ��������
I2 = CompositeSimpson(a, b, n, f) / sqrt(2 * pi);  % ����simpson
s = @(x)((2^(1/2)*pi^(1/2)*erf((2^(1/2)*x)/2))/2);  % ���ֺ��ԭ����
I = (s(b) - s(a)) / sqrt(2 * pi);  % ��ȷ��
[h1, n1] = ComputeH(1e-4, "CompositeTrapezoidal", a, b, f, I);
[h2, n2] = ComputeH(1e-4, "CompositeSimpson", a, b, f, I);