function Xkmin = It24C2(A, beta, eps)
Niter = 2000;
Xk = beta*A';
minnormd = Inf;
normd1 = Inf;
for i = 1:Niter
    Xk1 = (1+beta)*Xk - beta*(Xk*A)'*Xk;
    normd = norm(Xk1-Xk);
    if normd < minnormd
        minnormd = normd;
        Xkmin = Xk;
    end
    if abs(normd/normd1 - 1 - beta) < eps
        break;
    end
    normd1 = normd;
    Xk = Xk1;
end
end