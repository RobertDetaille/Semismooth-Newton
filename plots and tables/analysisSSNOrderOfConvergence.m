function [] = analysisSSNOrderOfConvergence()
% creates a plot to illustrate the order of convergance

% initialize
disc = 500;
marginals = {@margBiNorm,@margDirac,@margExp,@margNorm,@margUni};

% gamma ungesteuert
[err1,toctime1] = ssn(marginals{1},marginals{3},@costQuad,disc,disc);
[err2,toctime2] = ssn(marginals{1},marginals{5},@costQuad,disc,disc);
[err3,toctime3] = ssn(marginals{3},marginals{5},@costQuad,disc,disc);

% create plot
semilogy(toctime1,err1,'LineWidth',1.1);
hold on
semilogy(toctime2,err2,'LineWidth',1.1);
semilogy(toctime3,err3,'LineWidth',1.1);
%leg = legend('$\gamma$ ungesteuert','$\gamma$ gesteuert','Location','northeast','interpreter','latex');
str1 = append('Marginale: ', func2str(marginals{1}),', ' ,func2str(marginals{3}));
str2 = append('Marginale: ', func2str(marginals{1}),', ' ,func2str(marginals{5}));
str3 = append('Marginale: ', func2str(marginals{3}),', ' ,func2str(marginals{5}));
leg = legend(str1,str2,str3,'Location','northeast','interpreter','latex');
set(gca,'FontSize',12)
set(leg,'FontSize',12)
grid on
set(gca, 'YMinorTick','off','YMinorGrid','off')   
hold off

%{
% save figure
funCallStack = dbstack;
methodName = funCallStack(1).name;
nameFigure = strcat('img_',methodName,'_',func2str(marginals{1}),'_',...
    func2str(marginals{2}),'_',num2str(gEnd),'_',num2str(disc),'.png');
saveas(gcf,nameFigure)
%}

end