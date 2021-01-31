function [mu,x,k] = SymmetricPowerMethod(n,A,x,tol,N)
% ¶Ô³ÆÃÝ·¨
mu = zeros(N, 1);
k = 1;
x = x / norm(x);
while k <= N
    y = A * x;
    mu(k) = x' * y;
    if norm(y) == 0
        disp('Eigenvector'); disp(pre_x);
        disp('A has the eigenvalue 0,select a new vector x and restart');
        return;  % STOP
    end
    err = norm(x - y / norm(y));
    x = y / norm(y);
    if err < tol
        plot(1:k, mu(1:k));
        mu = mu(k);
        x = x / max(abs(x));
        return;  % STOP
    end
    k = k + 1;
end
if k > N
    disp('Maximum number of iterations exceeded.Procedure SymmetricPowerMethod completed unsuccessfully');
end
end