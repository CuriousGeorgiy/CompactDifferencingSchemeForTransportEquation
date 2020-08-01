syms nu real
nuVal = 100;

fileID = fopen('coeffs.txt', 'r');
a1 = double(subs(str2sym(fgetl(fileID)), nu, nuVal));
a0 = double(subs(str2sym(fgetl(fileID)), nu, nuVal));
b1 = double(subs(str2sym(fgetl(fileID)), nu, nuVal));
b0 = double(subs(str2sym(fgetl(fileID)), nu, nuVal));
c1 = double(subs(str2sym(fgetl(fileID)), nu, nuVal));
c0 = double(subs(str2sym(fgetl(fileID)), nu, nuVal));
fclose(fileID);

omegaVals = linspace(0, 2 * pi, 1000);
approximantSymbol = -(a0 * exp(-1i * omegaVals) + b0 + c0 * exp( 1i * omegaVals))./ ...
     (a1 * exp(-1i * omegaVals) + b1 + c1 * exp( 1i * omegaVals));
preciseSymbol = exp(-1i * nuVal * omegaVals);

loglog(omegaVals, abs(approximantSymbol - preciseSymbol));