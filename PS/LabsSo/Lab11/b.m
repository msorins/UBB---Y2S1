function b
   alpha = input('Significance level: ');
   X = [7 4 3 12 14 3 7 12 13 5 10 5 4 8 2 6 2 12 5 1 1 2 4 6 9 8 17 1 9 10 9 7 7 13 11 7]
   sigma = 5; %Standard Deviation
   
   fprintf('H0: sigma = 5 \n');
   fprintf('HO: sigma != 9 \n');
   
   [h, p, ci, stats] = vartest(X, 25, 'Alpha', alpha, 'Tail', 'both')
   
   %RR
   tt1 = chi2inv(alpha / 2, stats.df)
   tt2 = chi2inv(1 - alpha / 2, stats.df)
   fprintf('RR = (-Inf, %f) U (%f, Inf)', tt1, tt2)
   
endfunction