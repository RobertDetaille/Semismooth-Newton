function analysisSSNvsSinkhornIterations()
% creates a plot comparing the iterations of the Sinkhorn-Algorithm
% with the semismooth Newton-Algorithm

disc = 500;
[kSSN,~,errSSN] = ssn(@margA,@margB,@costQuad,disc,disc);
[kSink,~,errSink] = sinkhorn(@margA,@margB,@costQuad,disc,disc);

% figure
loglog(1:kSSN,errSSN,'LineWidth',1.1);
hold on
loglog(1:kSink,errSink,'LineWidth',1.1);
leg = legend('SSN','Sinkhorn', 'Location','northeast');
set(leg,'FontSize',12)
set(gca,'FontSize',12)
%xlabel('Iterations', 'interpreter', 'latex');
%ylabel('Error','interpreter', 'latex');
grid on
set(gca, 'YMinorTick','off','YMinorGrid','off')   
hold off
    
%{
% save figure
funCallStack = dbstack;
methodName = funCallStack(1).name;
nameFigure = strcat('img_',methodName,'_',num2str(disc),'.png');
saveas(gcf,nameFigure)
%} 
end
