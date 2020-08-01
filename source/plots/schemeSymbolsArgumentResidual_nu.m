syms nu real
nu = 100;

omega = linspace(0, 0.011 * pi, 1000);
omega = omega(2:end);
approximantSymbolArgumentCompact = 2 * atan(3 * nu .* sin(omega) ./...
                            ((2 + nu^2) .* cos(omega) - nu^2 + 4));
approximantSymbolArgumentCN = -2 * atan(nu .* sin(omega) ./ 2);
preciseSymbolArgument = -nu * omega;
residualCompact = abs(approximantSymbolArgumentCompact - preciseSymbolArgument);
residualCN = abs(approximantSymbolArgumentCN - preciseSymbolArgument);

axesLineWidth = 1;
axesFontSize = 13;
figureWidth = 6;
figureHeight = 5;
labelsFontSize = 29;
plotLegendFontSize = 13;
plotLineWidth = 1.5;
plotMarkerSize = 8;

fig = figure(1);
loglog(omega, residualCompact, 'r',...
       omega, residualCN, 'b',... 
       'LineWidth', plotLineWidth, 'MarkerSize', plotMarkerSize);

fig.Color = 'w';
fig.InvertHardcopy = 'on';
fig.PaperType = 'a4';
fig.PaperUnits = 'centimeters';
fig.PaperPosition = [(fig.PaperSize(2) - figureHeight) / 2,...
    (fig.PaperSize(1) - figureWidth) / 2, figureWidth, figureHeight];
fig.Position = [fig.Position(1), fig.Position(2),...
                figureWidth * 100, figureHeight * 100]; 

axes = gca;
axes.Box = 'off';
axes.FontName = 'Helvetica';
axes.FontSize = axesFontSize;
axes.LineWidth = axesLineWidth;
axes.TickDir = 'out';
axes.TickLength = [0.02 0.02];
axes.XMinorTick = 'off';
axes.YMinorTick = 'off';

xLabel = xlabel('\omega');
yLabel = ylabel('\Delta');

plotLegend = legend('Compact', 'Crank-Nicolson');
plotLegend.Location = 'east';

set([xLabel, yLabel, plotLegend], 'FontName', 'AvantGarde');
set([xLabel, yLabel], 'FontSize', labelsFontSize);
plotLegend.FontSize = plotLegendFontSize;
set([xLabel, yLabel, plotLegend], 'FontWeight' , 'bold');

export_fig schemeSymbolsArgumentsResidual(nu=100)Plot -m10
