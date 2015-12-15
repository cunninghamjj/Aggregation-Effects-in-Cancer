%% Clean Workspace

% Function that clears all intermediate variables from workspace leaving
% only the variables necessary for analysis.

function [modelName] = cleanWorkspace(modelName, x, v, N, mu, G)

% Clear all variables from base workspace not send in to this function.
evalin('base', 'clear');

% Assign back to base workspace variables with model name header.
assignin('base', strcat(modelName, '_x'), x);
assignin('base', strcat(modelName, '_v'), v);
assignin('base', strcat(modelName, '_N'), N);
assignin('base', strcat(modelName, '_mu'), mu);

% Extract specific values from variables to also assign back to base
% workspace.
assignin('base', strcat(modelName, '_xEnd'), x(end));
assignin('base', strcat(modelName, '_xMinimum'), min(x));
assignin('base', strcat(modelName, '_vEnd'), v(end));
assignin('base', strcat(modelName, '_NEnd'), N(end));
assignin('base', strcat(modelName, '_muEnd'), mu(end));
assignin('base', strcat(modelName, '_GEnd'), G);

end

