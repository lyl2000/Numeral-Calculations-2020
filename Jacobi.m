function [x,k] = Jacobi(n,A,b,tol,N,x0)
% jacobi
k = 1;
x = zeros(n, 1);
while k <= N
    for i = 1 : n
        s = 0;
        for j = 1 : n
            if j == i
                continue;
            end
            s = s + A(i, j) * x0(j);
        end
        x(i) = (-s + b(i)) / A(i, i);
    end
    if (x - x0)' * (x - x0) < tol
        return;  % STOP
    end
    k = k + 1;
    x0 = x;
end
disp("Method failed after N iterations");
end