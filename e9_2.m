A = [1, 0, 0;
    1, 1, 0;
    1, 1, 1;
    1, 1, 1];
b = [1;0;1;0];
%[H, R, b] = HouseHolder(size(A, 1), A, b);
[G, R, b] = Givens(size(A, 1), A, b);