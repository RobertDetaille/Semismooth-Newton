function [x,y] = margBiNorm(N)
% Bimodal normal distribution

% build marginal 
pd1 = makedist('Normal','mu',0.45,'sigma',0.03);
pd2 = makedist('Normal','mu',0.75,'sigma',0.07);

x = 0:(1/N):1;
x(end) = [];
y = 0.3*pdf(pd1,x) + 0.7*pdf(pd2,x);
y = y/trapz(x,y);

% figure
% plot(x,y,'LineWidth',1.2)
% saveas(gcf,'margBiNorm.png')

% export as csv
% graph = [x;y];
% writematrix(graph,'margBiNorm500.csv') 
end

