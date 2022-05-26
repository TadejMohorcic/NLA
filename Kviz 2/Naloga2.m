f = @(x,y,z) 1.6e-3 * x.^2 + 1.6e-3 * y.^2 - 1;
g = @(x,y,z) 5.3e-4 * x.^2 + 5.3e-4 * y.^2 + 5.3e-4 * z.^2 + 2.7e-2 * x - 1;
h = @(x,y,z) 1.4e-4 * x + 1.0e-4 * y + z - 3.4e-3;

% 1. del naloge
interval = [-50 50 -50 50 -50 50];
% fimplicit3(f, interval)
% hold on
% fimplicit3(g, interval)
% hold on
% fimplicit3(h, interval)

l = @(x,y,z) [f(x,y,z); g(x,y,z); h(x,y,z)];
disp(norm(l(25, -3, 0)))

% 2. del naloge
i0 = [1 4 2 5 7 3 6 8 4 7 5 6 9 7 8 9 1 4 8 10 2 5 9 10 3 6 10];
j0 = [1 1 2 2 2 3 3 3 4 4 5 6 6 7 7 7 8 8 8 8 9 9 9 9 10 10 10];
a0 = [1.6e-3 5.3e-4 1.6e-3 5.3e-4 1.0e-4 1.6e-3 5.3e-4 1.0e-4 5.3e-4 1 5.3e-4 5.3e-4 1 -3.4e-3 1 1.0e-4 -1 -1 -3.4e-3 1.0e-4 -1 -1 -3.4e-3 1 -1 -1 -3.4e-3];
A0 = full(sparse(i0,j0,a0));

i1 = [7 4 8 5 9 6 10];
j1 = [7 8 8 9 9 10 10];
a1 = [-1.4e-4 0.027 -1.4e-4 0.027 -1.4e-4 0.027 -1.4e-4];
A1 = full(sparse(i1,j1,a1));

i2 = [1 4 2 5 3 6 10];
j2 = [8 8 9 9 10 10 10];
a2 = [1.6e-3 5.3e-4 1.6e-3 5.3e-4 1.6e-3 5.3e-4 0];
A2 = full(sparse(i2,j2,a2));

[X,e] = polyeig(A0,A1,A2);
v1 = X(:,13)./X(10,13); % delis z zadnjo komponento, da je ta 1.
t1 = [e(13) v1(8) v1(9)];
v2 = X(:,14)./X(10,14);
t2 = [e(14) v2(8) v2(9)];
disp(t1)
disp(t2)
    
% 3. del naloge
T = @(l) A0 + A1*l + A2*l^2;
dT = @(l) A1 + 2*A2*l;

[lam, vec] = ZapLinAproksimacija(T,dT,25,10000,1e-16);
x = vec./vec(10);
disp(x(9))