function opsCoeffsSym = readOpsCoeffs(fileName)
        fileId = fopen(fileName, 'r');
        numOpsCoeffs = 6;
        
        opsCoeffsSym = zeros(1, numOpsCoeffs, 'sym');
                  
        for i = 1:length(opsCoeffsSym)
                opsCoeffsSym(i) = str2sym(fgetl(fileId));
        end
        
        fclose(fileId);
end

