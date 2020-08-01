function T = compTimestepsNo(integrationTime, tau)
        T = fix(integrationTime / tau);
end

