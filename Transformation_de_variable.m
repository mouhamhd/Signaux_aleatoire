% ##########################
% TP sIGNAUX Aléatoire
% 
% Auteurs : Mouhameth YATE
% 
% Enseignant : Chehdi KASSEM

%% TRANSFORMATION DE VARIABLE ALEATOIRE
 
%-------------------------------------------------------------------
clear all; 
close all; 
clc;


R = 10;
n = 1024;
w_noise_g = randn(n , R);

A = 10;
B = 20;

X = w_noise_g;
Y = A.*X + B;

for k = 1:R
    %% Question a)b)c) histogramme et fonction d'autocorrélation de chaque réalisation de la variable Y
    figure(1); % Histogramme de chaque réalisation
    subplot(5,2,k);
    histogram(Y(:,k));
    xlabel('Réalisations');
    ylabel('effectifs');
    title("Histogramme de la réalisation" + k);

    figure(2);  %Fonction d'autocorrélation
    subplot(5,2,k);
    r = xcorr(Y(:,k)); % autocorrélation de chaque échantillon
    plot(r);
    xlabel('Echantillon');
    ylabel('amplitude');
    title("Fonction d'autocorrélation de la réalisation " + k); 
 end

 %% c)Fonction d'autocorrélation moyenne de la variable Y
    figure(3);
    r_moy = mean(xcorr(Y)');
    plot(r_moy);
    xlabel('Echantillon');
    ylabel('amplitude');
    title("Fonction d'autocorrélation moyenne des 10 réalisations");



