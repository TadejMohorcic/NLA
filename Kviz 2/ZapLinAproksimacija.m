function [lam, vec] = ZapLinAproksimacija(T,dT,lam,maxKorakov,tol)
% funckija sprejme funckijo T in njen odvod, ter vrne lastno vrednost lam
% in pripadajoč lastni vektor vec

for k = 1:maxKorakov
    [U, D] = eig(T(lam),dT(lam));
    lVrednosti = diag(D);
    [lNajmanjsa, i] = min(abs(lVrednosti));
    vec = U(:,i);

    if lNajmanjsa < tol
        break
    end
    
    lam = lam - lNajmanjsa;
end