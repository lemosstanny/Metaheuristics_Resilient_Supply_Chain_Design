function model = CreateModel()

% Supplier Raw material Cost - row type of material. column: suppliers
rmcost = [55 60	44	48	40	52	54	68	50	42;
          221 210 208 180 237 205 206 235 189 229;
          290 220 190 247 290 253 191 288 212 225;
          84  86  76  62  84  89  63  95  82  73];

% Supplier Raw material lead time
rmlt = [23	18	20 25 26 24	21 19 21 18;
        40  44  58 57 52 49 49 43 58 51;
        50  51  55 65 59 47 62 52 53 49;
        18  16  20 24 21 16 29 26 27 23];

% Distance Matrix. Supplier to facility
rmdm = [209 202 220 188 169 250 138 221 240 240];


%Supplier fixed cost. Considering same for each supplier.
sfc = 100;

% Supplier raw material capacity
rmcap = [105 108 110 117 118 108 113 105 91  116;
         60  79  75  77  75  63  66  68  54  61;
         48  45  54  42  46  55  45  50  44  53;
         145 125 127 145 199 122 207 120 204 137];

% Create a dummy for purchase matrix
rmsq = zeros(length(rmcap(:,1)),length(rmcap(1,:)));

     
%Delivery Location
% delidemand = [225 227 183 328]; %changed price to demand
%delilt    = [14 19 17 118];

model.rmsq=rmsq;
model.sfc=sfc;
model.rmcost=rmcost;
model.rmlt=rmlt;
model.rmcap=rmcap;
model.rmdm=rmdm;
% model.delidemand=delidemand;
%model.delilt=delilt;

end