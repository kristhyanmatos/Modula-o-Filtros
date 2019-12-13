# formula conceitual
#  A0cos(w0+Bmt);
fa = 1E6;                             # Frequ�ncia de amostragem
t  = [0:1/fa:1];                      # Periodo de amostragem
kf = 1000;                              # Fator de sensibilidade de frequ�ncia
fp = 1000;                            # Frequ�ncia da portadora
fm = 300;                             # Frequ�ncia do sinal mt
wc = 2*pi*fp;                         # Normaliza��o da frequ�ncia da portadora
wm = 2*pi*fm;                         # Normaliza��o da frequ�ncia do sinal mt
b  = (kf)/wm;                         # �ndice de modula��o
y  = cos(wc*t);                       # Portadora
mt = cos(wm*t);                       # Sinal

sinalModuladoFm = cos(wc*t + b*mt);                 # Formula conceitual



plot(t,y); title('portadora');
figure();
plot(t,mt); title('sinal');
figure();
plot(t,sinalModuladoFm); title('Modula��o em FM');
