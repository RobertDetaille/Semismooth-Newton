function [x,y]= margNorm(M)
% Normal distribution

% build marginal
pd1 = makedist('Normal','mu',0.65,'sigma',0.12);

x = 0:(1/M):1;
x(end) = [];
y = pdf(pd1,x);
y = y/trapz(x,y);

% figure
% plot(x,y,'LineWidth',1.2)
% saveas(gcf,'margNorm.png')

% export as csv
% graph = [x;y];
% writematrix(graph,'margNorm500.csv') 
end

