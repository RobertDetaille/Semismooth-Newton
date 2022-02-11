function analysisSSNvsSinkhornRuntime()
% creates a plot comparing the runtime of the Sinkhorn-Algorithm
% with the semismooth Newton-Algorithm

disc = 4000;
[toctime1,err1] = ssn(@margA,@margB,@costQuad,disc,disc);
[toctime2,err2] = sinkhorn(@margA,@margB,@costQuad,disc,disc);
    
% figure
semilogy(toctime1,err1,'LineWidth',1.1);
hold on
semilogy(toctime2,err2,'LineWidth',1.1);
leg = legend('SSN','Sinkhorn','Location','northeast','interpreter','latex');
set(gca,'FontSize',12)
set(leg,'FontSize',12)
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
