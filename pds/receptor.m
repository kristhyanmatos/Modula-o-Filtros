# ETAPA 1
# Carrega o sinal de mensagem
[sinal, fa] = audioread('C:\Users\ssoar\Documents\GitHub\Modula-o-Filtros\pds\audio.wav');

# ETAPA 2
# Filtro passa faixa
# N ordem [intervalo min e max]
h1 = fir1(100, [0.18 0.42]);

# Convolução entre os sinais
filtradoPF = conv(h1,sinal);

# ETAPA 3
# Demodulação
sinalDemodulado(1) = 0;                              
for i = 2:length(filtradoPF)
    if filtradoPF(i) > sinalDemodulado(i-1)
        sinalDemodulado(i) = filtradoPF(i);
    else
        sinalDemodulado(i) = sinalDemodulado(i-1) - 0.023*sinalDemodulado(i-1);
    end
end

# ETAPA 4
# Filtro passa faixa voz
hv = fir1(200, [0.025 0.13]);
filtradoVoz = conv(hv,sinalDemodulado);

# ETAPA 5
# Filtro passa baixa
fp = 1500;  # Frenquencia de passagem
fc = 1800;  # Frequencia de corte

# Normalização das frequencias
wp = (fp/(fa/2))*pi;
wc = (fc/(fa/2))*pi;

wt = wc - wp;   # Frenquencia de transferencia
wci = (wc+wp)/2; # Frenquencia de corte intermediaria

M = ceil((6.6*pi/wt)) + 1;
hd = passaBaixaideal(wci,M);
w_ham = hamming(M)';
h2 = hd.*w_ham;

# Convolução entre os sinais
sinalPassado = conv(h2,filtradoVoz);