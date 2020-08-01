function fig = plotApproxError(NVals, errorsC, errorsL2, axesLineWidth, axesFontSize,...
                         figWidth, figHeight, labelsFontSize, plotLegendFontSize,...
                         plotLineWidth, plotMarkerSize)
        fig = figure(1);
        loglog(NVals, errorsC, 'b',...
               NVals, errorsL2, 'r',...
               'LineWidth', plotLineWidth, 'MarkerSize', plotMarkerSize);
        setFigParams(fig, figWidth, figHeight);
        
        axes = gca;
        setAxesParams(axes, axesLineWidth, axesFontSize);
        
        setLabelsLegendParams(labelsFontSize, plotLegendFontSize);
end

function setFigParams(fig, figWidth, figHeight)
        fig.Color = 'w';
        fig.InvertHardcopy = 'on';
        fig.PaperType = 'a4';
        fig.PaperUnits = 'centimeters';
        fig.PaperPosition = [(fig.PaperSize(2) - figHeight) / 2,...
            (fig.PaperSize(1) - figWidth) / 2, figWidth, figHeight];
        fig.Position = [fig.Position(1), fig.Position(2),...
                        figWidth * 100, figHeight * 100];
end

function setAxesParams(axes, axesLineWidth, axesFontSize)
        axes.Box = 'off';
        axes.FontName = 'Helvetica';
        axes.LineWidth = axesLineWidth;
        axes.FontSize = axesFontSize;
        axes.TickDir = 'out';
        axes.TickLength = [0.02 0.02];
        axes.XTick = [50, 100, 150, 200, 500 1000];
        axes.XMinorTick = 'off';
        axes.YMinorTick = 'off';
end

function setLabelsLegendParams(labelsFontSize, plotLegendFontSize)
        xLabel = xlabel('N');
        yLabel = ylabel('\Delta');
        plotLegend = legend('C compact', 'L^2 compact');
        plotLegend.Location = 'best';
        set([xLabel, yLabel, plotLegend], 'FontName', 'AvantGarde');
        set([xLabel, yLabel], 'FontSize', labelsFontSize);
        plotLegend.FontSize = plotLegendFontSize;
        set([xLabel, yLabel, plotLegend], 'FontWeight', 'bold');
end
