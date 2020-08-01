function [errorC, errorL2] = compApproxErrors(uApprox, uExact)
        errorC = abs(uApprox - uExact);
        errorC = max(errorC(:));
        
        errorL2 = (uApprox - uExact) .^ 2;
        errorL2 = sqrt(sum(errorL2(:)));
end

