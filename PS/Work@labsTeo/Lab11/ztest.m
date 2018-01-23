function ztest(x,m0,sigma,alpha,tiptest)
    xbar = mean(x);
    n = length(x);
    z = (xbar - m0) * sqrt(n) / sigma;
    switch tiptest
        case 'bilateral'
            cuantila = norminv(1-alpha/2,0,1);
            if abs(z) < cuantila
                fprintf('H0\n')
            else
                fprintf('H1\n')
            end
        case 'right'
            cuantila = norminv(1-alpha,0,1);
            if z < cuantila
                fprintf('H0\n')
            else
                fprintf('H1\n')
            end
        case 'left'
            cuantila = norminv(alpha,0,1);
            if z > cuantila
                fprintf('H0\n')
            else
                fprintf('H1\n')
            end
    end
end
                    