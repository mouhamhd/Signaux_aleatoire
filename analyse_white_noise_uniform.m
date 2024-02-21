% ##########################
% TP sIGNAUX Aléatoire
% 
% Auteurs : Mouhameth YATE
% 
% Enseignant : Chehdi KASSEM

%% ANALYSE DU BRUIT BLANC UNIFORME
 
%-------------------------------------------------------------------
clear all; 
close all; 
clc;

%% a) 
R = 20;
n = 1024;

w_noise_u = rand(n , R);
%% b) signal temporel et histogramme

for k = 1:R
    %% Question c) signal tempor'el et histogramme de chaque réalisation
    
    figure(1);
    subplot(5,4,k);
    plot(w_noise_u(:,k));
    xlabel('Echantillon');
    ylabel('amplitude bruit');
    title("Signal temporel de la réalisation" + k );
    
    figure(2);
    subplot(5,4,k);
    histogram(w_noise_u(:,k));
    xlabel('Réalisations');
    ylabel('effectifs');
    title("Histogramme de la réalisation " + k);

%% c) & d)Fonction d'autocorrélation
    figure(3);    
    subplot(5,4,k);
    var(w_noise_u(:,k)) % pour afficher la variance de caque réalisation
    r = xcorr(w_noise_u(:,k)); % autocorrélation de chaque échantillon
    plot(r);
    xlabel('Echantillon');
    ylabel('amplitude');
    title("Fonction d'autocorrélation de la réalisation " + k); 
 end
  %% d)Fonction d'autocorrélation moyenne
    figure(4);
    r_moy = mean(xcorr(w_noise_u)');
    plot(r_moy);
    xlabel('Echantillon');
    ylabel('amplitude');
    title("Fonction d'autocorrélation moyenne des 20 réalisations");


%% e) t1 et t2 : histogramme
   t1 = 500;
   t2 = 785;
   
   figure(5);
   subplot(2,1,1);
   histogram(w_noise_u(t1,:) ,20);
   subplot(2,1,2);
   histogram(w_noise_u(t2,:) , 20);

%% f) calcul de la moyenne et variance de t1/t2
   moyt1 = mean(w_noise_u(t1,:)); % moyennes de t1
   moyt2 = mean(w_noise_u(t2,:)); % moyennes de t2

   vart1 = (var(w_noise_u(t1,:)))^2; %variance de t1 ^
   vart2 = (var(w_noise_u(t2,:)))^2; %variance de t2 

