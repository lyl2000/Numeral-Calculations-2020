function [L,U,x] = LUDecomposition(n,A,b)
% LU�ֽ���ⷽ����
L = zeros(n, n); U = zeros(n, n);
% ����L U
L(1, 1) = 1;
U(1, 1) = A(1, 1) / L(1, 1);
for j = 2:n
    U(1, j) = A(1, j) / L(1, 1);%U�ĵ�1��
    L(j, 1) = A(j, 1) / U(1, 1);%L�ĵ�1��
end
for i = 2:n-1
    s = 0;
    for k = 1:i-1
        s = s + L(i, k) * U(k, i);
    end
    L(i, i) = 1;
    U(i, i) = (A(i, i) - s) / L(i, i);
    for j = i+1:n
        s = 0;
        for k = 1:i-1
            s = s + L(j, k) * U(k, i);
        end
        L(j, i) = (A(j, i) - s) / U(i, i);%L��i��
        s = 0;
        for k = 1:i-1
            s = s + L(i, k) * U(k, j);
        end
        U(i, j) = (A(i, j) - s) / L(i, i);%U��i��
    end
end
L(n, n) = 1;
s = 0;
for k = 1:n-1
    s = s + L(n, k) * U(k, n);
end
U(n, n) = (A(n, n) - s) / L(n, n);
% Ly = b ��y
y = zeros(n, 1); y(1) = b(1);
for i = 2:n
    s = 0;
    for j = 1:i-1
        s = s + L(i, j) * y(j);
    end
    y(i) = (b(i) - s) / L(i, i);
end
% Ux = y ��x
x = zeros(n, 1); x(n) = y(n) / U(n, n);
for i = n-1:-1:1
    s = 0;
    for j = n:-1:i+1
        s = s + U(i, j) * x(j);
    end
    x(i) = (y(i) - s) / U(i, i);
end
end