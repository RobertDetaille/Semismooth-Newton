function [c] = costMetr(M,N, x1, x2)
% metric cost function

c = zeros(M,N);
for i = 1:size(c,1) %=M
    for j = 1:size(c,2) %=N
        c(i,j) = abs(x1(i)-x2(j));
    end
end
end