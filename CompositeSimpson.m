function [XI] = CompositeSimpson(a,b,n,f)
% ¸´ºÏSimpson
h = (b - a) / n;
XI0 = f(a) + f(b);
XI1 = 0;  %odd
XI2 = 0;  %even
for i = 1:n-1
    X = a + i * h;
    if mod(i, 2) == 1
        XI1 = XI1 + f(X);
    else
        XI2 = XI2 + f(X);
    end
end
XI = h * (XI0 + 2 * XI2 + 4 * XI1) / 3;
end