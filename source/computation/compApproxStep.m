function [uApprox, errorAbs] = compApproxStep(uApproxPrev, uExact, X, t, tau, opCoeffsMatrices)
        uApprox = -opCoeffsMatrices('A') \ opCoeffsMatrices('B') * uApproxPrev;
        
        errorAbs = abs(uApprox - uExact);
end

