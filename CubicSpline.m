function [a,b,c,d] = CubicSpline(n,x,a,fpo,fpv,mode)
% 样条插值
% mode:
% Nature 基于自然边界的样条函数
% Cycle 基于周期边界的样条函数
% Clamped 基于固定边界的样条函数
% Undistorted 基于非扭曲边界的样条函数
h = zeros(n, 1);
for i = 1:n
    h(i) = x(i+1) - x(i);
end
alpha = zeros(n+1, 1);
for i = 2:n
    alpha(i) = 3 / h(i) * (a(i+1) - a(i)) - 3 / h(i-1) * (a(i) - a(i-1));
end
if mode == "Cycle"
    alpha(1) = (a(2) - a(1)) / h(1) - (a(n+1) - a(n)) / h(n);
elseif mode == "Clamped"
    alpha(1) = 3 / h(1) * (a(2) - a(1)) - 3 * fpo;
    alpha(n+1) = 3 * fpv - 3 / h(n) * (a(n+1) - a(n));
end
A = zeros(n+1, n+1);
for i = 2:n
    A(i, i-1) = h(i-1); A(i, i) = 2 * (h(i-1) + h(i)); A(i, i+1) = h(i);
end
if mode == "Nature"
    A(1, 1) = 1; A(n+1, n+1) = 1;
elseif mode == "Cycle"
    A(1, 1) = 2 * h(1) / 3; A(1, 2) = h(1) / 3; A(1, n) = h(n) / 3; A(1, n+1) = 2 * h(n) / 3;
    A(n+1, 1) = 1; A(n+1, n+1) = -1;
elseif mode == "Clamped"
    A(1, 1) = 2 * h(1); A(1, 2) = h(1);
    A(n+1, n) = h(n); A(n+1, n+1) = 2 * h(n);
elseif mode == "Undistorted"
    A(1, 1) = h(2); A(1, 2) = -(h(1) + h(2)); A(1, 3) = h(1);
    A(n+1, n-1) = h(n); A(n+1, n) = -(h(n-1) + h(n)); A(n+1, n+1) = h(n-1);
end
[l, u, c] = LUDecomposition(n+1, A, alpha);
b = zeros(n, 1); d = zeros(n, 1);
for j = n:-1:1
    b(j) = (a(j+1) - a(j)) / h(j) - h(j) / 3 * (2 * c(j) + c(j+1));
    d(j) = (c(j+1) - c(j)) / (3 * h(j));
end
a = a(1:n)'; c = c(1:n);
end