function [x] = phi(a,b,c,gamma,my,ny)
% objective function of the discretized and regualized dual problem

A = max((a'+b)-c,0);
x = 0.5*(norm(A, 'fro'))^2 - gamma*(dot(my,a) + dot(ny,b));
end
