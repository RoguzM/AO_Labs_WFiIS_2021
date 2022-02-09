clear; clc;
close all;

im = double(imread('ptoki.jpg'))/255;
%imshow(im);
im = rgb2gray(im);
%im = imbinarize(im, 0.72);
%im = imclose(im, ones(10));
%imshow(im);


%kaczki w roznych kanalach
h = 2, w = 2, i = 1;
imc = im;
imc(:,:,[2,3]) = 0;
subplot(h, w, i); i = i+1;
imshow(imc);

%czerwo, informacja o bialych piorach
imc = im;
imc(:,:,[1,3]) = 0;
subplot(h, w, i); i = i+1;
imshow(imc);

%ziel, gradient (duza roznica)
imb = im;
imb(:,:,[1,2]) = 0;
subplot(h, w, i); i = i+1;
imshow(imb);

%nieb, info o czarnych piorach
imc = im;
imc = rgb2gray(im);
subplot(h, w, i); i = i+1;
imshow(imc);

%figure;
h = 2, w = 2, i = 1;
zbinaryzowany niebieski
subplot(h, w, i); i = i+1;
imb = imbinarize(im(:,:,3));
imshow(imb);

%zbinaryzowany czerwony
% subplot(h, w, i); i = i+1;
% imr = imbinarize(im(:,:,1));
% imshow(imr);

%korzystamy z dwoch poprzednich informacji celem polaczenia logiki
imz = ~imb | imr;
%subplot(h, w, i); i = i+1;
%imshow(imz);

%wygladzamy niedoskonalosci
imz = imopen(imz, ones(3));
%subplot(h, w, i); i = i+1;
%imshow(imz);

%figure;
%h = 2, w = 2, i = 1;

%mozemy wybrac ktore kaczki wyswietlic
%l = bwlabel(imz);
%liczymy kaczki
%n = max(l, [], 'all');

%informacje o 4 kaczce
%prop = regionprops(l == 4, 'all');
%area- powierzchnia kaczki w pixelach
%centroid- srodek masy kaczki
%boundingbox- rozpietosc kaczki, prostokat w ktorym zamkniety jest obiekt
%eccentricity- miara jak bardzo na srodku jest srodek masy
%Perimeter- obwod kaczki

% subplot(h, w, i); i = i+1;
% imshow(prop.Image);
% 
% subplot(h, w, i); i = i+1;
% imshow(l == 4);

%wspolczynnik malinowskij opisuje podobienstwo figury do kola za pomoca obwodu i pola 
%wspolczynnik Bloir-Bliss opisuje za pomoca odleglosci od centroidu 
%wspolczynnik donielbrone
%wspolczynnik herdicka
%wspolczynnik ferreta dotyczy rozpietosci figury, zaleznosc od osi ukladu

a=regionprops(im,'all');
a(1).Image;
a = regionprops(im,'all');
fun =  {@AO5RBlairBliss, @AO5RCircularityS, @AO5RCircularityL, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
M = zeros(length(a), length(fun));
for i =1:length(a)
    for j = 1:length(fun)
        M(i,j) =  fun{j}(a(i).Image);
    end
end

