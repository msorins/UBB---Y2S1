function Ttest(x,m0,alpha,tiptest)
    xbar = mean(x);
    sn = std(x); % diferenta fata de std(x,1) : la x se normalizeaza cu n, la alalaltu cu n-1
    n = length(x);
    t = (xbar - m0)*sqrt(n) / sn;
    switch tiptest
        case 'bilateral'
            cuantila = tinv(1-alpha/2,n-1);
            if abs(t) < cuantila
                fprintf('H0')
            else
                fprintf('H1')
            end
        case 'right'
            cuantila = tinv(1-alpha,n-1);
            if t < cuantila
                fprintf('H0')
            else
                fprintf('H1')
            end
        case 'left'
            cuantila = tinv(alpha,n-1);
            if t > cuantila
                fprintf('H0')
            else
                fprintf('H1')
            end
    end
end