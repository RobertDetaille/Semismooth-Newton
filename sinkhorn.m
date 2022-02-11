function [tEnd,k] = sinkhorn(my,ny,cost,M,N)
% sinkhorn, computes optimal transport plan using sinkhorn fixpoint iteration
% marginals: mu,nu
% costfuntiocn: cost
% discretization: M,N

% initialize parameters
eps = 0.0005;
tau = 0.001;

% marginals
[x1,y1] = my(M);
[x2,y2] = ny(N);

% cost function in matrix form
[c] = cost(M,N,x1,x2);

% calculate Matrix K, Dimensions NxM
K = exp(-(1/eps)*c+1);  

% Sinkhorn fixpoint iteration
b = ones(M,1);
k = 0;
tic
while true
    k = k+1;
    toctime(k) = toc;
    
    a = y1'./(K*b);
    b = y2'./(a'*K)';
    
    % stopping criteria
    t1 = K*b;
    t2 = a'*K;
    err(k) = max(max(abs(a.*t1-y1')),max(abs(t2'.*b-y2')));
    %disp(err(k));
    if err(k) < tau
        break
    end
end

plan = (diag(a)*K*diag(b));
tEnd = toctime(k);

%writematrix(plan,'test.csv')
end

