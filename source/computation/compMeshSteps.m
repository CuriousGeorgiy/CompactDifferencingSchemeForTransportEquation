function [tau, h] = compMeshSteps(nu, V, N, circleLength)
        h = circleLength / N;
        tau = nu * h / V;
end

