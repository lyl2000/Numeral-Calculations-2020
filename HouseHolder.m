function [H,R,b] = HouseHolder(n,A,b)
% HouseHolder±ä»»
I = eye(n);
H = eye(n);
for i = 1 : size(A, 2)
    a = [zeros(i-1, 1);A(i:size(A,1), i)];
    alpha = -sign(a(i)) * norm(a);
    e = zeros(n, 1); e(i) = 1;
    v = a - alpha * e;
    disp(['v', num2str(i)]); disp(v);
    h = I - 2 * (v * v') / (v' * v);
    H = h * H;
    disp(['H', num2str(i)]); disp(h);
    A = h * A;
    b = h * b;
    disp(['A', num2str(i)]); disp(A);
end
R = A(1:size(A, 2),1:size(A, 2));
end