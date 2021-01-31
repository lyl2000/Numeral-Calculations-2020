function [mu,x,k] = PowerMethod(n,A,x,tol,N)
% ÃÝ·¨
pre_x = x;
mu = zeros(N, 1);
k = 1;
[v, p] = max(abs(x));
x = x ./ x(p);
while k <= N
    y = A * x;
    mu(k) = y(p);
    [v, p] = max(abs(y));
    if v == 0
        disp('Eigenvector'); disp(pre_x);
        disp('A has the eigenvalue 0,select a new vector x and restart');
        return;  % STOP
    end
    err = max(abs(x - y ./ y(p)));
    x = y ./ y(p);
    if err < tol
        plot(1:k, mu(1:k));
        mu = mu(k);
        return;  % STOP
    end
    k = k + 1;
end
if k > N
    disp('Maximum number of iterations exceeded.Procedure PowerMethod completed unsuccessfully');
end
end