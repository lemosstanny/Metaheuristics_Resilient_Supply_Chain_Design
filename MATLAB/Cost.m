function [z, RMSQC]= Cost(x,model)

% condition 
% demand uses raw material in a set ratio D = 0.5rm4+0.2rm3+0.15rm2+0.15rm1

demand=x(1:4);         %Expected price for 4 different markets
Logicost=x(5);          %Expected logistics cost per mile 
% demand=model.delidemand;
demand=sum(demand);     %takes total demand since it is assumed as centralised supply chain.

% Quota required
rm1demand=ceil(0.20*demand);
rm2demand=ceil(0.15*demand);
rm3demand=ceil(0.30*demand);
rm4demand=ceil(0.35*demand);

% Evaluating random networks for cost, leadtime, total distance
[RM1, RMSQ1]=test(rm1demand,1,model);
[RM2, RMSQ2]=test(rm2demand,2,model);
[RM3, RMSQ3]=test(rm3demand,3,model);
[RM4, RMSQ4]=test(rm4demand,4,model);


%Cost(Procuremnt, Logistic)
z1 = (RM1(1)+RM2(1)+RM3(1)+RM4(1)) + sum(Logicost*sum(RM1(3)+RM2(3)+RM3(3)+RM4(3)));

%Lead time
z2 = max([RM1(2),RM2(2),RM3(2),RM4(2)]);

z=[z1 z2]';

RMSQC = [RMSQ1;RMSQ2;RMSQ3;RMSQ4]; %RMSQ combined

RMSQC(all(~RMSQC,2), : ) = []; %Delete row with zero values


end