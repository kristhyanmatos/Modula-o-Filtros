function sinalPassado = poema(sinal,fa)
  #[sinal, fa] = audioread('C:\Users\kristhyanmatos\Documents\GitHub\Modula-o-Filtros\pds\audio.wav');
  
  fp = 7000;  # frenquencia de passagem
  fc = 8500; # frequencia de corte
  #sound(sinal,fa);
  # normalização das frequencias
  wp = (fp/(fa/2))*pi;
  wc = (fc/(fa/2))*pi;

  wt = wc - wp;   # frenquencia de transferencia
  wci = (wc+wp)/2; # frenquencia de corte intermediaria

  M = ceil((6.6*pi/wt)) + 1;
  hd = passaBaixaideal(wci,M);
  w_ham = hamming(M)';
  h = hd.*w_ham;

  sinalPassado = conv(h,sinal);
  trf(sinalPassado,fa);
endfunction
