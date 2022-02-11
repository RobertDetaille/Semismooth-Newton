function [x] = phiDe(a,b,c,gamma,my,ny,eps,M,N)
% objective function of the discretized and regualized dual problem

A = max((a'+b)-c,0);
x = 0.5*(norm(A, 'fro'))^2 - gamma*(dot(my,a) + dot(ny,b)) ...
    + (eps/(M*2))*(norm(a)^2) + (eps/(N*2))*(norm(b)^2);
end
