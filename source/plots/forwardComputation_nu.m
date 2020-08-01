nu = 0.1;
V = 5;
integrationTime = 0.01;
circleLength = 2 * pi;

uExact = @(x, t, tau) sin(x - V * t * tau);

opsCoeffsSym = readOpsCoeffs('coeffsCompact.txt');

NStart = 100;
NStep = 100;
NEnd = 600;
NVals = NStart:NStep:NEnd;
errorsC = zeros(1, length(NVals));
errorsL2 = zeros(1, length(NVals));

for N = NVals
    N
    [tau, h] = compMeshSteps(nu, V, N, circleLength);
    T = compTimestepsNo(integrationTime, tau);
    X = genXMesh(circleLength, N);
    
    opsCoeffs = subsOpsCoeffsSym(opsCoeffsSym, nu);
    opCoeffsMatrices = genOpCoeffsMatrices(opsCoeffs, N);

    uApproxPrev = uExact(X, 0, tau);
    errorsAbs = zeros(N, T);
    
    for t = 1:T
        [uApprox, errorAbs] = compApproxStep(uApproxPrev, uExact(X, t, tau),...
                                             X, t, tau, opCoeffsMatrices);
        uApproxPrev = uApprox;
        
        errorsAbs(:, t) = errorAbs;
    end
    
    [errorC, errorL2] = compApproxErrors(uApprox, uExact(X, T, tau));
    errorsC(NVals == N) = errorC;
    errorsL2(NVals == N) = errorL2;
end

compTans(NVals, errorsC, errorsL2);

%plotApproxExact(X, uApprox, uExact(X, T, tau));

axesLineWidth = 1;
axesFontSize = 17;
figWidth = 6;
figHeight = 5;
labelsFontSize = 29;
plotLegendFontSize = 14;
plotLineWidth = 1.5;
plotMarkerSize = 8;

fig = plotApproxError(NVals, errorsC, errorsL2, axesLineWidth, axesFontSize,...
                figWidth, figHeight, labelsFontSize, plotLegendFontSize,...
                plotLineWidth, plotMarkerSize);
        
export_fig approximationError(N)CL2Norms(nu=0.11) -m10
