function chi2test(x,alpha,sigma0,tiptest)
    sigman = var(x);
    n = length(x);
    c = (n-1)*sigman/sigma0^2;
    switch tiptest
        case 'bilateral'
            c1 = chi2inv(alpha/2,n-1);
            c2 = chi2inv(1-alpha/2,n-1);
            if (c1<c) && (c<c2)
                fprintf('H0\n')
            else
                fprintf('H1\n')
            end
        case 'right'
            c1 = chi2inv (1-alpha,n-1);
            if c<c1
                fprintf('H0\n')
            else
                fprintf('H1\n')
            end
        case 'left'
            c1 = chi2inv(alpha,n-1);
            if c>c1
                fprintf('H0\n')
            else
                fprintf('H1\n')
            end
    end % switch
end