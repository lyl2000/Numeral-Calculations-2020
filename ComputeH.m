function [h,n] = ComputeH(tol,method,a,b,f,I)
% 给定计算精度，计算h与n
maxH = 200;
for n = 1 : maxH
    h = (b - a) / n;
    if method == "CompositeTrapezoidal"
        I1 = CompositeTrapezoidal(a, b, n, f) / sqrt(2 * pi);
    elseif method == "CompositeSimpson"
        I1 = CompositeSimpson(a, b, n, f) / sqrt(2 * pi);
    end
    if abs(I1 - I) <= tol
        break;
    end
end
end