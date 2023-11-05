function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
  %        |0,    0 <= x < val1
  % u(x) = |ax+b, val1 <= x <= val2
  %        |1,    val2<x<=1
  % u(x) continua <=> | lim[x->val1, x>val1] ax + b = 0 => a*val1 + b = 0 => val1/(val2-val1) + b = 0 => b = val1 /(val1 -val2)
  %                   | lim[x->val2, x<val2] ax + b = 1 => a*val2 + b = 1 =>a(val1-val2) = -1 => a = 1/(val2-val1)
  if( 0 <= x && x < val1)
    y = 0;
  else 
    if( val1 <= x && x <= val2)
      a = 1 / (val2 - val1);
      b = val1 / (val1-val2);
      y = a*x + b;
    else 
      if( val2 < x && x<= 1)
        y = 1;
      endif
    endif
  endif
  endfunction
