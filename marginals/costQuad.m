function [c] = costQuad(M,N, x1, x2)
% quadratic cost function

c = zeros(M,N);
for i = 1:size(c,1) %i=1,...,M
    for j = 1:size(c,2) %j=1,..,N
        c(i,j) = (x1(i)-x2(j))^2;
    end
end
end