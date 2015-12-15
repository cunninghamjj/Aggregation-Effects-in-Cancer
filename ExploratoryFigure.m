%% Exploratory Figure

fig2 = figure('Name', modelName,'NumberTitle','off');

%Plot drug efficacy over time 
subplot(2, 2, 1)
semilogy(1:1:length(mu), mu, 'k', 'LineWidth', 3);
title([mat2str(aggregationEffect), ' ', mat2str(neighborhoodSize)], 'FontSize', 24);
xlabel('Time', 'FontSize', 20)
ylabel('Drug Efficacy', 'FontSize', 18)
set(gca, 'FontSize', 13);
xlim([0 simMaxTime])
box on

%Plot population density over time
subplot(2, 2, 2)
hold on
plot(1:1:length(x), x, 'k', 'LineWidth', 3);
title([' ', char(10), '\alpha = ' , num2str(alpha), ' \beta = ', num2str(beta)], 'FontSize', 24);
xlabel('Time', 'FontSize', 20)
ylabel(sprintf('Population \nDensity'), 'FontSize', 18)
set(gca, 'FontSize', 13);
xlim([0 simMaxTime])
ylim([0 100])
box on

%Plot resistance strategy over time
subplot(2, 2, 3)
hold on
plot(1:1:length(v), v, 'k', 'LineWidth', 3);
xlabel('Time', 'FontSize', 20)
ylabel(sprintf('Resistance \nStrategy'), 'FontSize', 18)
set(gca, 'FontSize', 13);
xlim([0 simMaxTime])
ylim([0 2])
box on

%Plot neighborhood size over time
subplot(2, 2, 4)
hold on
plot(1:1:length(N), N, 'k', 'LineWidth', 3);
xlabel('Time', 'FontSize', 20)
ylabel(sprintf('Neighborhood \nSize'), 'FontSize', 18)
set(gca, 'FontSize', 13);
xlim([0 simMaxTime])
ylim([0 100])
box on



