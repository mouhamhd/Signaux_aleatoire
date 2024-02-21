% ##########################
% TP sIGNAUX Aléatoire
% 
% Auteurs : Mouhameth YATE
% 
% Enseignant : Chehdi KASSEM

%% FILTRAGE DE VARIABLE ALEATOIRE
 
%-------------------------------------------------------------------
clear all; 
close all; 
clc;
%% a) filtre Butterworth
fc = 300;
fs = 1000;

figure(1);
[b,a] = butter(6,fc/(fs/2));

freqz(b,a,[],fs)

subplot(2,1,1);
ylim([-100 20]);

%% b) filtre du bruit blanc
R = 1;
n = 1024;
w_noise_g = randn(n , R);
w_noise_u = rand(n , R);

A = 10;
B = 20;

X_g = w_noise_g;
X_u = w_noise_u;


h_g = filter(b, a, X_g);
h_u = filter(b, a, X_u);

figure(2);
subplot(2,1,1);
plot(X_g);
ylabel("amplitude");
xlabel("echantillon ");
title("Bruit blanc gaussien");

subplot(2,1,2);
plot(h_g);
ylabel("amplitude");
xlabel("echantillon ");
title("Bruit blanc gaussien filtré");

figure(3);
subplot(2,1,1);
plot(X_u);
ylabel("amplitude");
xlabel("echantillon ");
title("Bruit blanc uniforme");

subplot(2,1,2);
plot(h_u);
ylabel("amplitude");
xlabel("echantillon ");
title("Bruit blanc uniforme filtré");
