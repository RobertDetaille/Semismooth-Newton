function [x,y] = margA(N)

% build marginal 
x = 0:(1/N):1;
x(end) = [];
y = exp(-100.*(x-0.2).^2) + exp(-20.*abs(x-4))+10^-2;
y = y/trapz(x,y);

% figure
% plot(x,y,'LineWidth',1.2,'color','r')
% saveas(gcf,'margBiNorm.png')

% export as csv
% graph = [x;y];
% writematrix(graph,'margA500.csv') 
end
