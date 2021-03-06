%% Set alpha and beta for desired aggregation effect

% The 8 preset aggregation effects are shown below
% 1)  a = 1 		b = 0       - Original Model (No aggregation effects)
% 2)  a = 0 		b = 0       - Dilution
% 3)  a = 1 		b = 6       - Group Detoxification
% 4)  a = 1.5       b = 0       - Danger In Numbers
% 5)  a = 1 		b = -0.5    - Group Sellout
% 6)  a = 0         b = -0.5    - Dilution to Sellout Switchover
% 7)  a = -0.5      b = 6       - Best Case For Tumor
% 8)  a = 1.5       b = -0.5    - Worst Case For Tumor

function [alpha, beta] = setAggregationEffects(effect)

if strcmp(effect, 'None') == 1
    alpha = 1;
    beta = 0;
    
elseif strcmp(effect, 'Dilution') == 1
    alpha = 0;
    beta = 0; 
    
elseif strcmp(effect, 'GroupDetox') == 1
    alpha = 1;
    beta = 6; 
    
elseif strcmp(effect, 'DangerInNumbers') == 1
    alpha = 1.5;
    beta = 0;  
    
elseif strcmp(effect, 'GroupSellout') == 1
    alpha = 1;
    beta = -0.5;  
    
elseif strcmp(effect, 'Switchover') == 1
    alpha = 0;
    beta = -0.5;  
    
elseif strcmp(effect, 'BestCase') == 1
    alpha = -0.5;
    beta = 6;   
    
elseif strcmp(effect, 'WorstCase') == 1
    alpha = 1.5;
    beta = -0.5;
    
end