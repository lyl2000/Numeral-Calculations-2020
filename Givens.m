function [G,R,b] = Givens(n,A,b)
% Givens�任
G = eye(n);
for col = 1 : size(A, 2)  % �ӵ�1�е����1��
    for row = size(A, 1) : -1 : col + 1  % �����1�е���1��
        if A(row, col) == 0
            continue;
        end
        disp([num2str(row), ' ', num2str(col)]);
        c = A(col, col) / sqrt(A(col, col)^2+A(row, col)^2);
        s = A(row, col) / sqrt(A(col, col)^2+A(row, col)^2);
        g = eye(size(A, 1));
        g(col, col) = c; g(row, col) = -s; g(col, row) = s; g(row, row) = c;
        disp('G'); disp(g);
        G = g * G;
        A = g * A;
        disp('A'); disp(A);
        b = g * b;
    end
end
R = A(1:size(A, 2),1:size(A, 2));
end