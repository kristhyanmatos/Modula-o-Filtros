# formula conceitual
#  A0cos(w0+Bmt);
kf = 2.5;                             #
fc = 1/10;                            # Frequência da portadora
fm = 1/50;                            # Frequência do sinal mt
n = [1:fm/4:256];                     # Periodo de amostragem
b = 2*pi*kf;                          # Índice de modulação
wc = 2*pi*fc;                         # Normalização da frequência da portadora
wm = 2*pi*fm;                         # Normalização da frequência do sinal mt
y = cos(wc*n);                        # Portadora
plot(y);
mt = cos(wm*n);                       # Sinal
z = cos(wc*n + b*mt);                 # Formula conceitual

plot(y); title('portadora');
figure();
plot(x); title('sinal');
figure();
plot(z); title('Modulação em FM');
