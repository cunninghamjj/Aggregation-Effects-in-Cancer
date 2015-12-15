% clear('all')
% close('all')
% clc

%% Paramters

% Simulation
simMaxTime = 10000;
speed = 0.001; %Slows down dynamics


%% Base model
r = 0.1;    % Growth rate (0-1)
Kmax = 100; % Carrying capacity
sigmaK = 1; % Cost of resistance (0-100)
b = 5;      % Resistance efficacy (0-10)
k = 0.1;    % Lethality of drug (0-1)
m = 0.1;    % Drug dosage (0-1)


%% Uncomment neighborhood size
% neighborhoodSize = 'None';
% neighborhoodSize = 'Small';
% neighborhoodSize = 'Scaled';
% neighborhoodSize = 'Large';
% neighborhoodSize = 'X';

% Or uncomment below to set the neighborhood size to a manual value.
neighborhoodSize = '3';


%% Uncomment aggregation effect
% aggregationEffect = 'None';
% aggregationEffect = 'Dilution';
% aggregationEffect = 'GroupDetox';
% aggregationEffect = 'DangerInNumbers';
% aggregationEffect = 'GroupSellout';
% aggregationEffect = 'Switchover';
% aggregationEffect = 'BestCase';
% aggregationEffect = 'WorstCase';

% Set alpha and beta for aggregation effect
% [alpha, beta] = setAggregationEffects(aggregationEffect);

% Or uncomment below to set alpha and beta manually
aggregationEffect = 'Manual';
alpha = 0;
beta = 1;

%% Set initial conditions
% Set population size to carrying capacity
x = zeros(1, simMaxTime);
x(1) = Kmax;

% Set resistance strategy to none
v = zeros(1, simMaxTime);
v(1) = 0.0;

% Set initial neighborhood size
N = zeros(1, simMaxTime);
N(1) = calculateN(neighborhoodSize, x(1));

% Calculate naive drug efficacy
mu = zeros(1, simMaxTime);
mu(1) = (m * N(1)^(alpha - 1)) / (k + (N(1)-1) * beta * v(1) + b * v(1));


%% Run dynamics

modelName = strcat(aggregationEffect, '_', neighborhoodSize);

for time = 1:1:simMaxTime-1
    
    % Compute carrying capacity dependent on current resistance strategy
    K = Kmax * exp ( (-v(time)^2) / (2 * sigmaK) );
    
    % Compute G-function
    G = r * ((K - x(time))/K) - (m * N(time)^(alpha - 1)) / (k + (N(time)-1) * beta * v(time) + b * v(time));
    
    % Calculate evolutionary dynamics
    deltaV = (speed * -r * x(time) * v(time))/(sigmaK * K) + (speed * m * N(time)^(alpha-1) * b)/( (k + (N(time)-1) * beta * v(time) + b * v(time))^2);
    
    % Calculate new population size
    x(time + 1) = x(time) * exp(G);
    
    % Calculate new neighborhood size
    N(time + 1) = calculateN(neighborhoodSize, x(time + 1));
    
    % Calculate new resistance strategy
    v(time + 1) = v(time) + deltaV;
    
    % Compute drug efficacy
    mu(time + 1) = (m * N(time)^(alpha - 1)) / (k + (N(time)-1) * beta * v(time) + b * v(time));
    
end


%% Plotting

% Plot full landscape at ESS
plotESSLandscape;
saveas( gcf, strcat(modelName, 'Landscape'), 'jpeg') 

% Exploratory figure
ExploratoryFigure;
saveas( gcf, strcat(modelName, 'Exploratory'), 'jpeg')


%% Data extraction to save

[modelName] = cleanWorkspace(modelName, x, v, N, mu, G);
save(modelName)
