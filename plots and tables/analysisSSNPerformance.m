function [T] = analysisSSNPerformance(j)
% convergence analysis
% param: j, specifies cost function
% return: T, table containing number of iterations and cputime

% initialize cost functions
costFunctions = {@costConc, @costMetr, @costQuad};
marginals = {@margBiNorm,@margDirac,@margExp,@margNorm,@margUni};
pairs = nchoosek(marginals, 2);

% create table
T = table();
for i=1:length(pairs)
    [k, tEnd] = ssn(pairs{i,1},pairs{i,2},costFunctions{j},500,500);

    rowName = strcat(func2str(pairs{i,1}),'_',func2str(pairs{i,2}),...
    '_',func2str(costFunctions{j}));
    
    temp = table(k,tEnd,'RowNames',{rowName});
    T = [T;temp];
end

%nameAnalysis = strcat('analysis_gesteuert_Nan600_',func2str(costFunctions{j}),'.csv');
%writetable(T,nameAnalysis) 
end