syms w nu a1 a0 b1 b0 c1 c0 real
vars = [a1, a0, b1, b0, c1, c0];

leftEquationPart(w) = a0 * exp(-1i * w) + b0 + c0 * exp(1i * w);
rightEquationPart(w) = -(a1 * exp(-1i * w) + b1 + c1 * exp(1i * w)) * ...
    exp(-1i * nu * w);
 
eqns = zeros(1, 6, 'sym');
eqns(1) = a1 + c1 == 1;
 
for i = 0:4
   leftEquationPartI(w) = diff(leftEquationPart, i); %#ok<SAGROW>
   rightEquationPartI(w) = diff(rightEquationPart, i); %#ok<SAGROW>
   eqns(i + 2) = leftEquationPartI(0) == rightEquationPartI(0);
end
 
solution = solve(eqns, vars);
 
fileID = fopen('coeffsСompact.txt', 'w+');
fprintf(fileID, '%s\n', char(solution.a1));
fprintf(fileID, '%s\n', char(solution.a0));
fprintf(fileID, '%s\n', char(solution.b1));
fprintf(fileID, '%s\n', char(solution.b0));
fprintf(fileID, '%s\n', char(solution.c1));
fprintf(fileID, '%s', char(solution.c0));
fclose(fileID);
