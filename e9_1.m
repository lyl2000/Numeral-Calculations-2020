% ตฺ9ีย ตฺ1ฬโ
A = [4, -1, 1;
    -1, 3, -2;
    1, -2, 3];
x = [1, -1, 2]'; n = 3; tol = 1e-9; N = 100000;
[mu1, x1, k1] = PowerMethod(n, A, x, tol, N);
[mu2, x2, k2] = SymmetricPowerMethod(n, A, x, tol, N);
[mu3, x3, k3] = InversePowerMethod(n, A, x, tol, N);