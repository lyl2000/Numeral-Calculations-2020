% ตฺ6 7ีย ตฺ1ฬโ
A=[
    4,-1,1;
    4,-8,1;
    -2,1,5
   ];
b=[7;-21;15];
[l, u, x1] = LUDecomposition(3, A, b);
x = zeros(3, 1); tol = 1e-8; N = 100;
[x2,k2] = Jacobi(3, A, b, tol, N, x);
[x3,k3] = GaussSeidel(3, A, b, tol, N, x);