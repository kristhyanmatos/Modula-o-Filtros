function [S, frequencia] = dsbsc(s1,s2,fs,t)
  aux = s1.*s2;
  figure();
  plot(t,aux);
  title('Modulação DSB-SC no tempo');
  xlabel('Tempo em s');
  ylabel('Amplitude');
  trf(aux,fs);
endfunction

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
