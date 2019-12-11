%----- Aplica��o de Filtro Digital em sinal de �udio -----%

%% Limpeza do Ambiente
clear;close;clc;

%% Amostragem do sinal de audio
[y,fs] = audioread('C:\Users\alleffonseca\Documents\GitHub\Modula-o-Filtros\pds\audio.wav');
%L� o arquivo de audio escolhido e armazena sua frequencia de amostragem.
y = y(:,1);
%Separando a primeira coluna (canal) da vari�vel que guarda o sinal de �udio.

%% Exibi��o do sinal de audio no dom�nio do tempo
%figure(1)
%subplot(2,2,1)
%hold on
%plot(y)
%title('Sinal de �udio original no dom�nio do tempo')
%xlabel('numero de amostras')
%grid on
%box on
%hold off

%% Calculo da DFT do sinal
tam = length(y);
%L� o numero de amostras
S = (1/tam) * fft(y);
%Calcula a transformada de fourier discreta
S = S(1:ceil(tam/2));
%Remove a redundancia

%% Exibi��o do sinal de audio no dom�nio da frequ�ncia
%figure(1)
%subplot(2,2,2)
%hold on
%stem(abs(S))
%title ('Sinal de audio original no dom�nio da frequ�ncia')
%xlabel ('Hz')
%grid on
%box on
%hold off

%% Filtragem
fc = 10000;
%Frequ�ncia de corte
N = buttord(fc/(2*fs),(fc+2000)/(2*fs), 3, 60);
%Ordem do Filtro (testes emp�ricos sugeriram esses valores)
[b,a] = butter(N,fc/(fs/2));
%Coefici�ntes da fun��o de transferencia do filtro
y_f = filter(b,a,y);
% Filtragem

%% Exibe o sinal filtrado no dom�nio do tempo
%figure(1)
%subplot(2,2,3)
%hold on
%plot(y_f)
%title ('Sinal de �udio filtrado no dom�nio do tempo')
%xlabel ('numero de amostras')
%grid on
%box on
%ylim([-0.6 0.6])
%hold off

%% Calculo da DFT do sinal filtrado
tam_f = length(y_f);
%L� o numero de amostras
S_f = (1/tam_f) * fft(y_f);
%Calcula a transformada de fourier discreta
S_f = S_f(1:ceil(tam_f/2));
%Remove a redundancia

%% Exibi��o do sinal filtrado no dominio da frequencia
%figure(1)
%subplot(2,2,4)
%hold on
%stem(abs(S_f))
%title ('Sinal de audio filtrado no dom�nio da frequ�ncia')
%xlabel ('Hz')
%grid on
%box on
%hold off

%% Reprodu��o do sinal de audio Original e do Filtrado
%sound(y,fs); %audio Original
%pause(5); %espera a reprodu��o do audio anterior
%sound(y_f,fs); %audio Filtrado

%% Cria o arquivo filtrado
%audiowrite('AudioFiltrado.wav',y_f,fs)