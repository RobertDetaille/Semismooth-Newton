function [x,y] = margUni(N)
% Uniform Distribution

% build marginal 
x = 0:(1/N):1;
x(end) = [];
y = ones(N,1)';
y = y/trapz(x,y);

% figure
% plot(x,y,'LineWidth',1.2)
% saveas(gcf,'margUni.png')

% export as csv
% graph = [x;y];
% writematrix(graph,'margUni500.csv') 
end

