# formula conceitual
#  A0cos(w0+Bmt);
fa = 1E6;                             # Frequência de amostragem
t  = [0:1/fa:1];                      # Periodo de amostragem
kf = 1000;                              # Fator de sensibilidade de frequência
fp = 1000;                            # Frequência da portadora
fm = 300;                             # Frequência do sinal mt
wc = 2*pi*fp;                         # Normalização da frequência da portadora
wm = 2*pi*fm;                         # Normalização da frequência do sinal mt
b  = (kf)/wm;                         # Índice de modulação
y  = cos(wc*t);                       # Portadora
mt = cos(wm*t);                       # Sinal

sinalModuladoFm = cos(wc*t + b*mt);                 # Formula conceitual



plot(t,y); title('portadora');
figure();
plot(t,mt); title('sinal');
figure();
plot(t,sinalModuladoFm); title('Modulação em FM');
