A = magic(6); [U,R] = schur(A);

% 1. del naloge
[Q,R2] = ZamenjajSosednja(R,3);
n = norm(R-R2);
disp(n);

% 2. del naloge
m = norm(Q,"fro");
disp(m);

% 3. del naloge
B = R;
for i=1:5
    [Q,R3] = ZamenjajSosednja(B,i);
    B = R3;
end
for j=4:-1:1
    [Q,R4] = ZamenjajSosednja(B,j);
    B = R4;
end
o = norm(R-B);
disp(o);