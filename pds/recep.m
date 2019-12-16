% ETAPA 1
[sinal, fa] = audioread('C:\Users\ssoar\Documents\GitHub\Modula-o-Filtros\pds\audio.wav');

% ETAPA 2
% Poema 1
% Filtro passa baixa
fcl = 11000;
wcl = fc1/(fa/2);
[bl , al]    = butter(10, wcl,'low');
filtradoPB = filtfilt(bl, al, sinal);
% Poema 2
% Filtro Passa Alta
fcu = 12000;
wcu = fcu/(fa/2);
[bu, au] = butter(10,wcu,'high');
filtradoPA = filtfilt(b,au,sinal);

% ETAPA 3
% Demodulação
% Poema 1
sinalDemodulado1(1) = 0;                          
for i = 2:length(filtradoPB)
    if filtradoPB(i) > sinalDemodulado1(i-1)
        sinalDemodulado1(i) = filtradoPB(i);
    else
        sinalDemodulado1(i) = sinalDemodulado1(i-1) - 0.023*sinalDemodulado1(i-1);
    end
end
% Poema 2
sinalDemodulado2(1) = 0; 
for i = 2:length(filtradoPA)
    if filtradoPA(i) > sinalDemodulado2(i-1)
        sinalDemodulado2(i) = filtradoPA(i);
    else
        sinalDemodulado2(i) = sinalDemodulado2(i-1) - 0.023*sinalDemodulado2(i-1);
    end
end

% ETAPA 4
% Filtro passa baixa
fc = 3500;
wc =fc2/(fa/2); 
[d , c] = butter(10, wc,'low');

%Poema 1
poema1 = filtfilt(d, c, sinalDemodulado1);
%Poema 2
poema2 = filtfilt(d, c, sinalDemodulado2);
