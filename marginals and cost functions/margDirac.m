function [x,y] = margDirac(N)
% Dirac Measure

% build marginal 
x = 0:(1/N):1;
x(end) = [];
y = zeros(N,1)';
y(N/2) = N;

% figure
% plot(x,y,'LineWidth',1.2)
% saveas(gcf,'margDirac.png')

% export as csv
% graph = [x;y];
% writematrix(graph,'margDirac500.csv') 
end