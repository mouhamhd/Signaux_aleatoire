% ##########################
% TP sIGNAUX Aléatoire
% 
% Auteurs : Mouhameth YATE
% 
% Enseignant : Chehdi KASSEM

%% ESTIMATION SPECTRALE A PARTIR DE PLUSIEURS REALISATION
 
%-------------------------------------------------------------------
clear all; 
close all; 
clc;

 %% 3)1) Estimation à partir d'une réalisation méthode  périodogramme
R = 1;
n = 1024;
w_noise_g = randn(n , R);

X_p = abs((fft(w_noise_g)).^2)/1024;

figure(1); % densité
subplot(3,1,1);
plot(X_p);
xlabel('Echantillon');
ylabel('amplitude bruit');
title('Densité spectrale par ');


subplot(3,1,2); % Histogramme 
histogram(X_p);
xlabel('Echantillon');
ylabel('amplitude bruit');
title('Histogramme par périodogramme');

subplot(3,1,3); % fonction d'autocorrélation
r_p = xcorr(X_p); % autocorrélation de chaque échantillon
plot(r_p);
xlabel('Echantillon');
ylabel('amplitude');
title("Fonction d'autocorrélation par corrélogramme"); 


%% 3)1)b Correlogramme

X_c = w_noise_g;
r_c = xcorr(X_c); % autocorrélation 
D_c = abs(fft(r_c)/1024); %densité spectrale

figure(2); % densité spectrale
subplot(3,1,1);
plot(D_c);
xlabel('Echantillon');
ylabel('amplitude bruit');
title('Densité spectrale par corrélogramme');


subplot(3,1,2); % Histogramme de la densité spectrale
histogram(D_c);
xlabel('Echantillon');
ylabel('amplitude bruit');
title('Histogramme par corrélogramme');

subplot(3,1,3); % fonction d'autocorrélation
R_c = xcorr(D_c); % autocorrélation 
plot(R_c);
xlabel('Echantillon');
ylabel('amplitude');
title("Fonction d'autocorrélation par corrélogramme"); 


%----------------------------------------------------------------------------
%----------------------------------------------------------------------------
%% 3)2)a Estimation à partir de plusieurs réalisations par périodogramme

R = 20;
n = 1024;
w_noise_g = randn(n , R);

X = abs(fft(w_noise_g').^2)/1024; % on prends le signal transposé
D_p = mean(X);

figure(3); % densité
subplot(3,1,1);
plot(D_p);
xlabel('Echantillon');
ylabel('amplitude bruit');
title('Densité spectrale méthode périodogramme à partir de plusieurs réalisations par périodogramme');
       
subplot(3,1,2); % histogramme
histogram(D_p);
xlabel('Réalisations');
ylabel('effectifs');
title('Histogramme à partir de plusieurs réalisations par périodogramme');
    
subplot(3,1,3); % fonction d'autocorrélation
r = xcorr(D_p); % autocorrélation de chaque échantillon
plot(r);
xlabel('Echantillon');
ylabel('amplitude');
title("Fonction d'autocorrélation à partir de plusieurs réalisations par périodogramme"); 






%% 3)2)a Estimation à partir de plusieurs réalisations par corrélogramme

X_c = w_noise_g;
r_c = xcorr(X_c); % autocorrélation 
D_c = mean(abs(fft(r_c)')/1024); %densité spectrale

figure(4); % densité spectrale
subplot(3,1,1);
plot(D_c);
xlabel('Echantillon');
ylabel('amplitude bruit');
title('Densité spectrale à partir de plusieurs réalisations par corrélogramme');


subplot(3,1,2); % Histogramme de la densité spectrale
histogram(D_c);
xlabel('Echantillon');
ylabel('amplitude bruit');
title('Histogramme par corrélogramme à partir de plusieurs réalisations');

subplot(3,1,3); % fonction d'autocorrélation
R_c = xcorr(D_c); % autocorrélation 
plot(R_c);
xlabel('Echantillon');
ylabel('amplitude');
title("Fonction d'autocorrélation à partir de plusieurs réalisations par corrélogramme"); 






