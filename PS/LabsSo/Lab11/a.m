function a
   alpha = input('Significance level: ');
   X = [7 4 3 12 14 3 7 12 13 5 10 5 4 8 2 6 2 12 5 1 1 2 4 6 9 8 17 1 9 10 9 7 7 13 11 7]
   sigma = 5; %Standard Deviation
   
   fprintf('H0: niu = 9 \n');
   fprintf('HO: niu < 9 \n');
   
   [h, p, ci, zval] = ztest(X, 9, sigma, 'Alpha', alpha, 'Tail', 'left');
   
   %RR
   tt = norminv(alpha, 0, 1)
   fprintf('RR = (-Inf, %f)', tt);
endfunction