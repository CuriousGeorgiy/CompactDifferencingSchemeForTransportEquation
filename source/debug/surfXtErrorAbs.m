function surfXtErrorAbs(X, integrationTime, T, errorsAbs)
        [TMesh, XMesh] = meshgrid(linspace(0, integrationTime, T), X);
        surf(TMesh, XMesh, errorsAbs);
end

