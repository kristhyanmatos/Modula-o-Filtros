fa  = 1E6;
t = [0:1/fa:1];
sinal = 0.3*sin(2*pi*2000*t) + 0.4*sin(2*pi*5000*t);

fp = 2300;  # frenquencia de passagem
fc = 3800; # frequencia de corte

# normalização das frequencias
wp = (fp/(fa/2))*pi;
wc = (fc/(fa/2))*pi;

wt = wc - wp;   # frenquencia de transferencia
wci = (wc+wp)/2; # frenquencia de corte intermediaria

M = ceil((6.6*pi/wt)) + 1;
hd = passaBaixaideal(wci,M);
w_ham = hamming(M)';
h = hd.*w_ham;

sinalFiltrado = conv(h,sinal);
trf(sinalFiltrado,fa);