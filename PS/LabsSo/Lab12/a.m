function a
   a = input('Significance: ');
   fprintf('H0: the two variances are equal \n');
   fprintf('H1: the two variances are not equal \n');

   x=[22.4 21.7 24.5 23.4 21.6 23.3 22.4 21.6 24.8 20.0];
   y=[17.7 14.8 19.6 19.6 12.1 14.8 15.4 12.6 14.0 12.2];

   [H,P,Ci,stats] = vartest2(x,y)

   if H == 0
     fprintf('The hypothesis H0 is accepted\n');
   else
    fprintf('The hypothesis H0 is rejected, the alternate hyphtesis H1 is accepted instead \n');
   end

   tt1=finv((a/2),stats.df1,stats.df2)
   tt2=finv(1-(a/2),stats.df1,stats.df2)

   fprintf('RR=(-Inf,%f)U(%f,Inf)\n',tt1,tt2);

endfunction
