function [RM, RMSQ]=test(rmdemand,c,model)

%This function is calculating the the cost of purchase for a randomly selected 
%route

sfc=model.sfc;
rmcost=model.rmcost;
rmlt=model.rmlt;
rmcap=model.rmcap;
rmdm=model.rmdm;
rmsq=model.rmsq;
RMC=0;
n=numel(rmcost(c,:));

% dummy to store iteration values. rm - raw material, d dummy
rmcostd = zeros(1, numel(rmcost));  % cost
rmltd = zeros(1, numel(rmlt));      % lead time
rmdmd = zeros(1, numel(rmdm));        %dm - distance matrix
       
                                       
    for ii = 1:n            %iteration till demand is fullfilled
        jj = randi([1, n]); %jj-random supplier selection
        cost = rmcost(c,jj);
        rmcostd(ii) = rmcost(c,jj);
        rmltd(ii) = rmlt(c,jj);
        rmdmd(ii) = rmdm(1,jj);
        
            if rmcap(c,jj) < 0     %checking supply quantity since we make -inf after each iteration and just incase same supplier gets picked up again  
                break;
            elseif rmcap(c,jj) > rmdemand
               RMC = RMC + cost*rmdemand;
               rmsq(c,jj) = rmdemand;       
               rmdemand=0;
            else
                RMC = RMC + cost*rmcap(c,jj);
                rmdemand = rmdemand-rmcap(c,jj);
                rmsq(c,jj) = rmcap(c,jj);
            end
        rmcap(c,jj) = -Inf;  %making capacity 0 at the used network line
       
        if rmdemand == 0
            break;
        end
    end
    
   
    %supplier fixed Cost.
    RMSFC = sfc*sum(rmcostd~=0); % 1000 is fixed cost per supplier and count of suppliers in the combination
    
    RMC = RMC+RMSFC;
    RMLT=max(rmltd); %max rm lead time
    RMTD=sum(rmdmd); %total distance
    
    RM = [RMC RMLT RMTD]; %Raw Material cost, lead time, total distance
    
    RMSQ=rmsq;

end


