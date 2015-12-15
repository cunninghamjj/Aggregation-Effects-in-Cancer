%% Calculate the value of N. 

% N is either a set value (1, 5, 10) or needs to be updated according the
% current value of the population density x. Depending on the chosen
% neighborhood size, the value of N is updated appropriately.

function [N] = calculateN(indexN, x)

if strcmp(indexN, 'None') == 1
    N = 1;
    
elseif strcmp(indexN, 'Small') == 1
    N = 5;
    
elseif strcmp(indexN, 'Scaled') == 1
    N = x/10 + 1;
    
elseif strcmp(indexN, 'Large') == 1
    N = 10;
    
elseif strcmp(indexN, 'X') == 1
    N = x;
    
else
    N = str2num(indexN);
end