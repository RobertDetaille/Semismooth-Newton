function [x,y] = margExp(N)
% Exponential Distribution

% build marginal 
x = 0:(1/N):1;
x(end) = [];
y = exppdf(x,0.3);
y = y/trapz(x,y);

% figure
% plot(x,y,'LineWidth',1.2)
% saveas(gcf,'margExp.png')

% export as csv
% graph = [x;y];
% writematrix(graph,'margExp500.csv') 
end
