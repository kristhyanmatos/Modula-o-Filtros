# formula conceitual
#  A0cos(w0+Bmt);
kf = 2.5;                             #
fc = 1/10;                            # Frequ�ncia da portadora
fm = 1/50;                            # Frequ�ncia do sinal mt
n = [1:fm/4:256];                     # Periodo de amostragem
b = 2*pi*kf;                          # �ndice de modula��o
wc = 2*pi*fc;                         # Normaliza��o da frequ�ncia da portadora
wm = 2*pi*fm;                         # Normaliza��o da frequ�ncia do sinal mt
y = cos(wc*n);                        # Portadora
plot(y);
mt = cos(wm*n);                       # Sinal
z = cos(wc*n + b*mt);                 # Formula conceitual

plot(y); title('portadora');
figure();
plot(x); title('sinal');
figure();
plot(z); title('Modula��o em FM');
