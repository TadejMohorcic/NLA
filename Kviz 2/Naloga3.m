f = @(x,y) 1.1*cos(x).^2 + 1.5 * sin(y).^2 + x.*y + sin(x.*y/5.0);
g = @(x,y,z) 1.1*cos(x).^2 + 1.5*sin(y).^2 + x.*y + sin(x.*y/5.0) + 0.1*z.^2;

l = linspace(-5,5,100);

M1 = f(l', l);

M2 = tenzeros([100,100,100]);
for i=1:100
    M2(:,:,i) = g(l', l, l(i));
end

% 1. del naloge
[U, S, V] = svd(M1);
 for m = 1:100
     razlika = max(max(abs(U(:,1:m)*S(1:m,1:m)*V(:,1:m)' - M1)));
     n = m;
     if razlika < 1e-3
         break
     end
 end
 disp(razlika)
 disp(n)

 % 2. del naloge
 P = ttm(M2, M1, 2);
 Pr = tenmat(P,3);
 p = Pr(:,5000);
 disp(norm(p))