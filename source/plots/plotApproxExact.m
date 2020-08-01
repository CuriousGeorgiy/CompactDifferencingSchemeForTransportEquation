function plotApproxExact(X, uApprox, uExact)
        hold on;
        plot(X, uApprox, 'b',...
             X, uExact, 'g');
        title('Comparison of approximation and exact graphics at t=T');
        xlabel('x');
        ylabel('u');
        legend('approximation', 'exact');
        hold off;
end

