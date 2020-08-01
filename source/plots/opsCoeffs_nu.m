syms nu real

opsCoeffsSym = readOpsCoeffs('coeffsCompact.txt');

nuStart = 0;
nuStep = 1;
nuEnd = 50;
nuVals = nuStart:nuStep:nuEnd;

opsCoeffsVals = [];
for nuVal = nuVals
    nuVal
    numOpsCoeffs = 6;
    
    opsCoeffs = zeros(1, numOpsCoeffs);
    for i = 1:numOpsCoeffs
                opsCoeffs(i) = double(subs(opsCoeffsSym(i), nu, nuVal));
    end
    
    opsCoeffsVals = vertcat(opsCoeffsVals, opsCoeffs);
end

axesLineWidth = 1;
axesFontSize = 17;
figureWidth = 6;
figureHeight = 5;
labelsFontSize = 29;
plotLegendFontSize = 17;
plotLineWidth = 1.5;
plotMarkerSize = 8;

fig = figure(1);
plot(nuVals, opsCoeffsVals(:, 1),...
     nuVals, opsCoeffsVals(:, 2),...
     nuVals, opsCoeffsVals(:, 3),...
     nuVals, opsCoeffsVals(:, 4),...
     nuVals, opsCoeffsVals(:, 5),...
     nuVals, opsCoeffsVals(:, 6),...
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
axes.XTick = [1 10 20 30 40 50];
axes.XMinorTick = 'off';
axes.YMinorTick = 'off';
axes.XAxisLocation = 'origin';

xLabel = xlabel('\nu');
xlim([-1 52]);
plotLegend = legend('a1', 'a0', 'b1', 'b0', 'c1', 'c0');
plotLegend.Location = 'north';
set([xLabel, plotLegend], 'FontName', 'AvantGarde');
xLabel.FontSize = labelsFontSize;
plotLegend.FontSize = plotLegendFontSize;
set([xLabel, plotLegend], 'FontWeight' , 'bold');

export_fig schemeSymbolsCoefficients(nu)Plot -m10
