function [] = analysisSSNMeshIndependence2()
% creates a plot to analyse mesh independence
    
disc = [500,1000,2000];
    
C = {};
for i = 1:length(disc)
    [k,err] = ssn(@margExp,@margNorm,@costQuad,disc(i),disc(i));
    %[k,err] = sinkhorn(@margA,@margB,@costQuad,disc(i),disc(i));
    C{i,1} = k;
    C{i,2} = err;
end
        
semilogy(1:C{1,1},C{1,2},'LineWidth',1.1);
hold on
semilogy(1:C{2,1},C{2,2},'LineWidth',1.1);
semilogy(1:C{3,1},C{3,2},'LineWidth',1.1);
%semilogy(1:C{4,1},C{4,2},'color',[0.5, 0.5, 0.5],'LineWidth',1.1);
str1 = append('$M,N=',num2str(disc(1)),'$');
str2 = append('$M,N=',num2str(disc(2)),'$');
str3 = append('$M,N=',num2str(disc(3)),'$');
leg = legend(str1,str2,str3,'Location','northeast','interpreter','latex');
set(leg,'FontSize',12)
grid on
set(gca, 'YMinorTick','off','YMinorGrid','off')
hold off
      
%{
% save figure
funCallStack = dbstack;
methodName = funCallStack(1).name;
nameFigure = strcat('img_',methodName,'.png');
saveas(gcf,nameFigure)
%}
    
end
