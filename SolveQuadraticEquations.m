function [x1,x2] = SolveQuadraticEquations(a, b, c)
%  求解二次方程
eps = 1e-8;
if abs(abs(b) - sqrt(b * b - 4 * a * c)) < eps
    x1 = (-b + sqrt(b * b - 4 * a * c)) / (2 * a);
    x2 = (-b - sqrt(b * b - 4 * a * c)) / (2 * a);
else
    if b > 0
        x1 = -2 * c / (b + sqrt(b * b - 4 * a * c));
        x2 = (-b - sqrt(b * b - 4 * a * c)) / (2 * a);
    elseif b < 0
        x1 = (-b + sqrt(b * b - 4 * a * c)) / (2 * a);
        x2 = -2 * c / (b - sqrt(b * b - 4 * a * c));
    else
        x1 = sqrt(-c / a);
        x2 = sqrt(-c / a);
    end
end
end