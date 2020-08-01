function X = genXMesh(circleLength, N)
        X = linspace(0, circleLength, N + 1).';
        X = X(1:N, :);
end

