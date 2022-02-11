function [T] = analysisSSNMeshIndependence1(j)
% convergence analysis
% param: j, specifies cost function
% return: T, table containing number of iterations and cputime

format short e
costFunctions = {@costConc, @costMetr, @costQuad};
marginals = {@margBiNorm,@margDirac,@margExp,@margNorm,@margUni};
pairs = nchoosek(marginals, 2);
discr = [100,1000,10000];

% create table
T = table();
for i=1:length(pairs)
    for k=1:length(discr)
        [finalErr] = ssn(pairs{i,1},pairs{i,2},costFunctions{j},discr(k),discr(k));
        finalErrors(k) = finalErr;
        
    end
    rowName = strcat(func2str(pairs{i,1}),'_',func2str(pairs{i,2}),...
        '_',func2str(costFunctions{j}));  
    temp = table(finalErrors(1),finalErrors(2),finalErrors(3),'RowNames',{rowName});
    T = [T;temp];
    
    % rename Columns
    temp.Properties.VariableNames = {num2str(discr(1)) num2str(discr(2)) num2str(discr(3))};
    
    % save Table each Iteration
    %nameTemp = strcat('analysisMesh_',num2str(discr(1)),'_',num2str(discr(2)),'_',... 
    %num2str(discr(3)),'_',rowName,'_',num2str(i),'.csv');
    %writetable(temp,nameTemp)
end
% rename Columns
T.Properties.VariableNames = {num2str(discr(1)) num2str(discr(2)) num2str(discr(3))};

% save Table
%nameAnalysis = strcat('analysisMesh_',num2str(discr(1)),'_',num2str(discr(2)),'_',... 
%    num2str(discr(3)),'_',func2str(costFunctions{j}),'.csv');
%writetable(T,nameAnalysis) 

end