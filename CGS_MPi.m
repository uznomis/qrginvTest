function Ap = CGS_MPi(A)
n = size(A,2);
[L,D,P] = ldl(A'*A);
Z = inv(L');
L = P'*L*P;
D = P'*D*P;
r = rank(D);
D11 = D(1:r,1:r);
U_n1 = Z(1:r,1:r)*diag(diag(D11).^(-1/2));
L1 = L*D.^(1/2);
V = L1';
V = V(1:r,r+1:n);
B = U_n1*V;
Kinv = eye(n-r)+B'*B;
Wp = [eye(r)-B*(Kinv\B');(Kinv\B')]*U_n1;
Ap = P*(Wp*Wp')*P'*A';
end