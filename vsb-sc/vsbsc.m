# DEPEDENCIAS
fa = 1000;
t = [0:1/fa:1];
fm = 4;
mt = cos(2*pi*fm*t) + 0.4*sin(2*pi*6*t) + 0.6*cos(2*pi*12*t);
fp = 50
portadora1 = cos(2*pi*fp*t);

#]]]]]]]]]]]]]]]]]]]]]
# SSB-SC
portadora2 = sin(2*pi*fp*t);
I = mt.*portadora1;
Q = imag(hilbert(mt)).*portadora2;
ssbsc  = I+Q;
plot(t,ssbsc);
trf(ssbsc,fa);

#|||||||||||||||||||||||||||||
# DSB-SC
  dsbsc = mt.*portadora1;
  figure();
  plot(t,dsbsc);
  title('Modulação DSB-SC no tempo');
  xlabel('Tempo em s');
  ylabel('Amplitude');
  trf(dsbsc,fa);

#))))))))))))))))))))))))))))))))
# VSB-SC
vsb = (ssbsc.+dsbsc)/2;
  figure();
  plot(t,vsb);
  title('Modulação VSB-SC no tempo');
  xlabel('Tempo em s');
  ylabel('Amplitude');
  trf(vsb,fa);