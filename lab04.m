clear; clc;
close all;

dlugosc = 2;szerokosc=2;i=1;
im = rgb2gray(double(imread('opera.jpg'))/255);
% imshow(im);

%transformata fouriera 
fim = fft2(im); %macierz liczb zespolonych
A = abs(fim);
phi = angle(fim);

subplot(dlugosc, szerokosc, i); i = i+1;
imshow(A);

subplot(dlugosc, szerokosc, i); i = i+1;
maxA = max(A, [], 'all');
imshow(fftshift(log(A)), [0, log(maxA)]);

subplot(dlugosc, szerokosc, i); i = i+1;
imshow(phi, [-pi, pi]);

figure;
dlugosc = 2;szerokosc=2;i=1;

%fale na ekranie
%A(125,5) = 10^5;

%zmiana fazy (inwersja), widac pasy przejasnien
%phi(1,1) = phi(1,1) + pi;

%zespolone
subplot(dlugosc, szerokosc, i); i = i+1;
z = A.*exp(1i * phi);
imz = ifft2(z);
imz = abs(imz);
imshow(imz);

f = fspecial('average', [9, 9]);
[h, w] = size(im);
ff = fft2(f, h, w);

%widmo amplitudowe filtra
fA = abs(ff);
fAmin = min(fA, [], 'all');
fAmax = max(fA, [], 'all');
subplot(dlugosc, szerokosc, i); i = i+1;
imshow(fftshift(log(fA)), log([fAmin, fAmax]));

A = fA.*A;
zc = A.*exp(1i * phi);
imc = ifft2(zc);
imc = abs(imc);
subplot(dlugosc, szerokosc, i); i = i+1;
imshow(imc);


%jakies nie wiem 
Amax = max(A, [], 'all');

subplot(dlugosc, szerokosc, i); i = i+1;
imshow(fftshift(log(A)), ([0, log(Amax)]));

