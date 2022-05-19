function [Q, R2] = ZamenjajSosednja(R, i)
% Funkcija sprejme zg. trikotno matriko R in index i, ter zamenja
% diagonalna elementa na mestih (i,i) in (i+1,i+1).
n = size(R);
Q = eye(n);

k = (R(i,i)-R(i+1,i+1))/R(i,i+1);
c = 1/sqrt(1+k^2);
s = k/sqrt(1+k^2);

Q(i,i) = c;
Q(i,i+1) = -s;
Q(i+1,i) = s;
Q(i+1,i+1) = c;

R2 = Q*R*Q';
end