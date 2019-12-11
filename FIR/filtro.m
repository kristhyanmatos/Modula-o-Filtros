%----- Aplicação de Filtro Digital em sinal de Áudio -----%

%% Limpeza do Ambiente
clear;close;clc;

%% Amostragem do sinal de audio
[y,fs] = audioread('C:\Users\alleffonseca\Documents\GitHub\Modula-o-Filtros\pds\audio.wav');
%Lê o arquivo de audio escolhido e armazena sua frequencia de amostragem.
y = y(:,1);
%Separando a primeira coluna (canal) da variável que guarda o sinal de áudio.

%% Exibição do sinal de audio no domínio do tempo
%figure(1)
%subplot(2,2,1)
%hold on
%plot(y)
%title('Sinal de áudio original no domínio do tempo')
%xlabel('numero de amostras')
%grid on
%box on
%hold off

%% Calculo da DFT do sinal
tam = length(y);
%Lê o numero de amostras
S = (1/tam) * fft(y);
%Calcula a transformada de fourier discreta
S = S(1:ceil(tam/2));
%Remove a redundancia

%% Exibição do sinal de audio no domínio da frequência
%figure(1)
%subplot(2,2,2)
%hold on
%stem(abs(S))
%title ('Sinal de audio original no domínio da frequência')
%xlabel ('Hz')
%grid on
%box on
%hold off

%% Filtragem
fc = 10000;
%Frequência de corte
N = buttord(fc/(2*fs),(fc+2000)/(2*fs), 3, 60);
%Ordem do Filtro (testes empíricos sugeriram esses valores)
[b,a] = butter(N,fc/(fs/2));
%Coeficiêntes da função de transferencia do filtro
y_f = filter(b,a,y);
% Filtragem

%% Exibe o sinal filtrado no domínio do tempo
%figure(1)
%subplot(2,2,3)
%hold on
%plot(y_f)
%title ('Sinal de áudio filtrado no domínio do tempo')
%xlabel ('numero de amostras')
%grid on
%box on
%ylim([-0.6 0.6])
%hold off

%% Calculo da DFT do sinal filtrado
tam_f = length(y_f);
%Lê o numero de amostras
S_f = (1/tam_f) * fft(y_f);
%Calcula a transformada de fourier discreta
S_f = S_f(1:ceil(tam_f/2));
%Remove a redundancia

%% Exibição do sinal filtrado no dominio da frequencia
%figure(1)
%subplot(2,2,4)
%hold on
%stem(abs(S_f))
%title ('Sinal de audio filtrado no domínio da frequência')
%xlabel ('Hz')
%grid on
%box on
%hold off

%% Reprodução do sinal de audio Original e do Filtrado
%sound(y,fs); %audio Original
%pause(5); %espera a reprodução do audio anterior
%sound(y_f,fs); %audio Filtrado

%% Cria o arquivo filtrado
%audiowrite('AudioFiltrado.wav',y_f,fs)