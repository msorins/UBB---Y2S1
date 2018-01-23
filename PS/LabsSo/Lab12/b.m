function b
  a = input('significance interval: ');
  fprintf('H0: the the mean of the first population is higher than the second\n');
  fprintf('H1: the mean of the second populatuion is higher or equal to the first\n');
  
  x = [22.4 21.7 24.5 23.4 21.6 23.3 22.4 21.6 24.8 20.0];
  y = [17.7 14.8 19.6 19.6 12.1 14.8 15.4 12.6 14.0 12.2];
  
  [H, P, Ci, stats] = ttest2(x,y,'Tail','right')
  
  if H==0
    fprintf('The hypothesis H0 is accepted\n');
  else
    fprintf('The hypothesis H0 is rejected, the alternate hyphtesis H1 is accepted instead \n');
  end

  tt = tinv(1-a,stats.df);
  fprintf('RR=(%f,Inf)\n',tt);