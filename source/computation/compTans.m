function compTans(NVals, errorsC, errorsL2)
        tanC = (log(errorsC(end)) - log(errorsC(1))) / (log(NVals(end)) - log(NVals(1)))
        tanL2 = (log(errorsL2(end)) - log(errorsL2(1))) / (log(NVals(end)) - log(NVals(1)))
end

