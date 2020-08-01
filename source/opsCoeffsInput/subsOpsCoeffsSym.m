function opsCoeffs = subsOpsCoeffsSym(opsCoeffsSym, nuVal)
        syms nu real
        
        opsCoeffsNames = {'a1', 'a0', 'b1', 'b0', 'c1', 'c0'};
        
        opsCoeffs = containers.Map('KeyType', 'char', 'ValueType',...
                                   'double');
        
        for i = 1:length(opsCoeffsNames)
                opCoeffName = opsCoeffsNames{i};
                opsCoeffs(opCoeffName) = double(subs(opsCoeffsSym(i),...
                                                         nu,...
                                                         nuVal));
        end
end

