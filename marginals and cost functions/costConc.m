function [c] = costConc(M,N, x1, x2)
% concave cost function

c = zeros(M,N);
for i = 1:size(c,1) 
    for j = 1:size(c,2)
        c(i,j) = sqrt(abs(x1(i)-x2(j)));
    end
end
end