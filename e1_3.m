% 第1章实验第2题
xn = inline('1 / 2 ^ x', 'x');
rn = inline('x / 2', 'x');
pn = inline('3 * x / 2 - y / 2', 'x', 'y');
qn = inline('5 * x / 2 - y', 'x', 'y');
x = zeros(11, 1);
r = zeros(11, 1);
p = zeros(11, 1);
q = zeros(11, 1);
r(1) = 0.994;
p(1) = 1;
p(2) = 0.497;
q(1) = 1;
q(2) = 0.497;
for i = 1 : 11
    x(i) = xn(i - 1);
end
for i = 2 : 11
    r(i) = rn(r(i - 1));
end
for i = 3 : 11
    p(i) = pn(p(i - 1), p(i - 2));
    q(i) = qn(q(i - 1), q(i - 2));
end
xr = [(0:10)', x-r];
xp = [(0:10)', x-p];
xq = [(0:10)', x-q];
save('x-r.txt', 'xr', '-ascii','-double');
save('x-p.txt', 'xp', '-ascii','-double');
save('x-q.txt', 'xq', '-ascii','-double');