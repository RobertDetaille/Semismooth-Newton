function [tEnd,k] = ssn(my,ny,cost,M,N)
% ssn, computes optimal transport plan using a regularized controlled semismooth Quasi-Newton method
% marginals: mu,nu
% costfuntiocn: cost
% discretization: M,N

% initialize parameters
r = 0.001;
tau = 0.002;
gamma = 0.001;
gammaStart = gamma;
gammaFinal = 0.001;
% update gamma 3 time to reach gammaFinal
updateFactor = nthroot(gamma/gammaFinal,3)+0.1; 

% marginals
[x1,y1] = my(M);
[x2,y2] = ny(N);

% cost function in matrix form
[c] = cost(M,N,x1,x2);

% Armijo paramters
theta = 0.3;
kappa = 0.5;

% initialize Lagrange multipliers
a = ones(1,M);
b = ones(1,N);

% regularized semismooth Newton method
k = 0;
check = 0;
% start time
tic
while true
    k = k + 1;
    toctime(k) = toc;
    
    % calculate plan
    P = repmat(a,N,1)' + repmat(b,M,1) - c;
    plan = max(P,0)./gamma;
    
    % calculate constraint violations
    t1 = plan*ones(N,1)-y1';
    t2 = (plan')*ones(M,1)-y2';
    err(k)= max(norm(t1, Inf),norm(t2, Inf));
    %disp(err(k));
    
    % check if tolerance is reached (and gamma small enough)
    if gamma == gammaFinal && err(k)<tau,break,end
    
    % calculate sigma
    sigma = zeros(M,N);
    sigma(P>=0)=1;
    
    % calculate da, db by solving linear system G*(da,db)=h with Newton derivative G
    diag1 = diag(sigma*ones(N,1));
    diag2 = diag((sigma.')*ones(M,1));
    G = [diag1, sigma; sigma.', diag2];
    G = G + r*eye(N+M);
    h = -gamma*[t1', t2'];
    x = G\h';    
    da = x(1:M);
    db = x(M+1:N+M);

    % compute the directional derivative d
    d = gamma*(sum(plan.*(da+db'),'all') - (dot(da,y1)+dot(db,y2)));
    
    % set t = 1 then backtracking until Armijo condition is met
    t = 1;
    while phi(a+t*da.',b+t*db.',c,gamma,y1,y2) > (phi(a,b,c,gamma,y1,y2) + t*theta*d)
        t = kappa*t;
        if t==0
            disp('Error: backtracking went wrong')
            return
        end
    end
    
    % update paramters
    a = a + t*da.';
    b = b + t*db.';
    
    % update gamma
    if err(k)<=tau
        gamma = gamma/updateFactor;
        if gamma < gammaFinal
            gamma = gammaFinal;
        end
        if gamma == gammaStart/updateFactor^2
            check = k;
        end
    end
    if k == check*3
        gamma = gammaFinal;
    end
    
end

% take time
tEnd = toctime(k);

%writematrix(plan,'test.csv')
end



