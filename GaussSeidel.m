function [x,k] = GaussSeidel(n,A,b,tol,N,x0)
% Gauss Seidel
k = 1;
x = zeros(n, 1);
while k <= N
    for i = 1 : n
        s1 = 0;
        for j = 1 : i-1
            s1 = s1 + A(i, j) * x(j);
        end
        s2 = 0;
        for j = i+1 : n
            s2 = s2 + A(i, j) * x0(j);
        end
        x(i) = (-s1 - s2 + b(i)) / A(i, i);
    end
    if (x - x0)' * (x - x0) < tol
        return;  % STOP
    end
    k = k + 1;
    x0 = x;
end
disp("Method failed after N iterations");
end