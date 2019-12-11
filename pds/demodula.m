function dm = demodula (sinalFiltrado,fa)
  
  Ts = 1/fa;
  c = 100e-9;
  r = 1.5e2;
  vd = .7;
  vc = 0;
  rc = c*r;
  o = Ts/(rc + Ts);

  for i = 1:numel(sinalFiltrado)
    
    vc = vc* (1-o);
    if(sinalFiltrado(i)>=vd+vc)
      vc = sinalFiltrado(i)-vd;
    endif
    dm(i) = vc;
    
  endfor
  dm = dm-mean(dm);
endfunction
