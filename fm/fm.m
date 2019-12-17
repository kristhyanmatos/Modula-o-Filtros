fa = 1E6;                             # Frequência de amostragem
t  = [0:1/fa:0.1];                    # Periodo de amostragem
kf = 1;                               # Fator de sensibilidade de frequência
ap = 1;                               # Amplitude da portadora
am = 5;                               # Amplitude do sinal
fp = 5000;                            # Frequência da portadora
fm = 120;                             # Frequência do sinal mt
wc = 2*pi*fp;                         # Normalização da frequência da portadora
wm = 2*pi*fm;                         # Normalização da frequência do sinal mt
b  = (2*pi*kf*am)/wm;                 # Índice de modulação
y  = cos(wc*t);                       # Portadora
mt = sin(wm*t);                       # Sinal

#mod = (cos(2*pi*Fc*t))-(b*sin(2*pi*Fc*t).*sin(2*pi*Fm*t)); #Sinal modulado
sinalModuladoFm = ap*cos(wc*t + b*mt);  # Formula conceitual

plot(t,y); title('portadora');
figure();
plot(t,mt); title('sinal');
figure();
plot(t,sinalModuladoFm); title('Modulação em FM');
trf(sinalModuladoFm,fa);
