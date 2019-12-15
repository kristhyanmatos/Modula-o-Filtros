# Carrega o sinal de mensagem
[sinal, fa] = audioread('C:\Users\ssoar\Documents\GitHub\Modula-o-Filtros\pds\audio.wav');

# filtro passa faixa
# n ordem [intervalo min e max]
h1 = fir1(100, [0.18 0.42]);

# convolução entre os sinais
filtradoPF = filter(h1,1,sinal);
# demodulação
Vc(1) = 0;                              % initial capacitor voltage
for i = 2:length(filtradoPF)
    if filtradoPF(i) > Vc(i-1)                   % diode on (charging)
        Vc(i) = filtradoPF(i);
    else                                % diode off (discharging)
        Vc(i) = Vc(i-1) - 0.023*Vc(i-1);
    end
end

# filtro passa faixa voz
hv = fir1(200, [0.025 0.13]);
filtradoVoz = filter(hv,1,Vc);

# filtro passa baixa
fp = 4500;  # frenquencia de passagem
fc = 5000; # frequencia de corte

# normalização das frequencias
wp = (fp/(fa/2))*pi;
wc = (fc/(fa/2))*pi;

wt = wc - wp;   # frenquencia de transferencia
wci = (wc+wp)/2; # frenquencia de corte intermediaria

M = ceil((6.6*pi/wt)) + 1;
hd = passaBaixaideal(wci,M);
w_ham = hamming(M)';
h2 = hd.*w_ham;

sinalPassado = conv(h2,filtradoVoz); 