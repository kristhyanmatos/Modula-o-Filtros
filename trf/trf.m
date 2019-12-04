function [S,frequencia] = trf(s,fs)
  normal = length(s);
  aux = 0:normal-1;
  T = normal/fs;
  frequencia = aux/T;
  S = fftn(s)/normal;
  fc = ceil(normal/2);
  S = S(1:fc);
  
  figure();
  plot(frequencia(1:fc),abs(S));
  title('Análise de Espectro');
  xlabel('Frequência em Hz');
  ylabel('Amplitude');
  
endfunction
