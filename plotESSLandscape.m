%% Plot ESS Landscape

fig1 = figure('Name', modelName,'NumberTitle','off');

%Set v bounds
v_landscape = linspace(0, 3, 100);

%Calculate G at all values of v
KESS = Kmax * exp((-v_landscape.^2 / (2*sigmaK)));
ESSLandscape = r .* ( (KESS - x(end))./KESS ) - ( (m .* (N(end).^(alpha-1))) ./ (k + (N(end)-1) .* beta .* v_landscape + b .* v_landscape) );

% Plot landscape
plot(v_landscape, ESSLandscape, 'k', 'LineWidth', 3);
hold on

% Plot ESS
plot(v(end), G, 'pk', 'MarkerFaceColor', 'k', 'MarkerSize', 20)

% Visuals
title([' ', char(10), '\alpha = ' , num2str(alpha), ' \beta = ', num2str(beta)], 'FontSize', 24);
xlabel('Resistance Strategy', 'FontSize', 20)
ylabel('G-Function', 'FontSize', 20)
set(gca, 'FontSize', 13);
xlim([0 1.5])
ylim([-0.15 0.15])
box on

% Add datatip
[arrowx,arrowy] = dsxy2figxy(gca, [v(end) + 0.075 v(end)], [ 0.1 G(end)]);
har = annotation('textarrow',arrowx,arrowy);
set(har,'String', ['N = ', mat2str(N(end))], 'Fontsize',8, 'FontWeight', 'bold')