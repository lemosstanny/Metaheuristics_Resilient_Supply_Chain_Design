function y=Mutate(x,mu,sigma)

    nVar=numel(x);
    
    nMu=ceil(mu*nVar);

    j=randsample(nVar,nMu);
    
    m= sigma*randn(size(j)); %added this
    
    y=x;
    
    y(j)=x(j)+ m(j); % sigma*randn(size(j)) modified 

end