function [x,y] = margB(M)
% build marginal 
x = 0:(1/M):1;
x(end) = [];
y = exp(-100.*(x-0.6).^2)+10^-2;
y = y/trapz(x,y);

% figure
% plot(x,y,'LineWidth',1.2)
% saveas(gcf,'margBiNorm.png')

% export as csv
% graph = [x;y];
% writematrix(graph,'margB500.csv') 
end

