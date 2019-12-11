fa = 1000;
t = [0:1/fa:1];
mt = cos(2*pi*4*t) + 0.4*sin(2*pi*6*t) + 0.6*cos(2*pi*12*t);
fp = 100;
portadora1 = cos(2*pi*fp*t);
portadora2 = sin(2*pi*fp*t);
I = mt.*portadora1;
Q = imag(hilbert(mt)).*portadora2;
sinal  = I.-Q;

figure();
plot(t,Q);
title('Sinal Q - Análise de Tempo');
xlabel('tempo em s');
ylabel = ('Amplitude');

trf(I,fa);
trf(Q,fa);

figure();
plot(t,sinal);
title('SSB-SC - Análise de Tempo');
xlabel('tempo em s');
ylabel = ('Amplitude');

# Análise na frequência
  normal = length(sinal);
  aux = 0:normal-1;
  T = normal/fa;
  frequencia = aux/T;
  S = fftn(sinal)/normal;
  fc = ceil(normal/2);
  S = S(1:fc);
  
  figure();
  plot(frequencia(1:fc),abs(S));
  title('SSB-SC - Análise de Espectro');
  xlabel('Frequência em Hz');
  ylabel('Amplitude');
