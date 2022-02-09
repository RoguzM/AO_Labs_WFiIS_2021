clear; clc;
close all;

h = 2;w=2;i=1;
% subplot(h, w, i); i = i+1;
 im = double(imread('zubr.jpg'))/255;
 im = rgb2gray(im);
% imshow(im);
% 
% %zuberek z filtrem (rozmyty), wagi dodatnie 1
% s = 3;
% f = ones(s)/s^2;
% 
% imf = imfilter(im, f);
% subplot(h, w, i); i = i+1;
% imshow(imf);
% 
% %zuberek z filtrem, wagi ujemne
% s = 3;
% f = -ones(s);
% f((s+1)/2, (s+1)/2) = s^2;
% imd = imfilter(im, f);
% subplot(h, w, i); i = i + 1;
% imshow(imd);
% 
% %zuberek z filtrem, wagi ujemne, ale ciemniejszy
% s = 3;
% f = -ones(s);
% f((s+1)/2, (s+1)/2) = s^2 - 1;
% imz = imfilter(im, f);
% subplot(h, w, i); i = i + 1;
% imshow(imz);
% 
% %zuberek z inwersja
% figure;
% h = 2, w = 2, i = 1;
% 
% % im = 1-im;
% subplot(h, w, i); i = i + 1;
% imshow(im);

%filtr medianowy
% imk = medfilt2(im, [12,12]);
% subplot(h, w, i); i = i + 1;
% imshow(imk);

%obraz binarny progowanie metoda otsu
% imb = im;
% t = graythresh(im);
% 
% imb(imb < t) = 0;
% imb(imb >= t) = 1;
% subplot(h, w, i); i = i + 1;
% imshow(imb);

%obraz binarny imbinarize //to samo co wyzej, inna metoda
%  subplot(h, w, i); i = i + 1;
%  imm = imbinarize(im);
%  imshow(imm);
% 
% imm = imbinarize(im, 'adaptive');
% subplot(h, w, i); i = i + 1;
% imshow(imm);

%google imbinarize sprawdz

%erozja, porownac z poprzednimi bez adaptive
figure;
h = 2, w = 2, i = 1;

im = 1-im;

% imb = imbinarize(im);
% imb = imerode(imb, ones(3));
% subplot(h, w, i); i = i + 1;
% imshow(imb);

%dylatacja
imb = imbinarize(im);
% imb = imdilate(imb, ones(3));
% subplot(h, w, i); i = i + 1;
% imshow(imb);

%erozja na dylatacji
% imb = imdilate(imb, ones(3));
% imb = imerode(imb, ones(3));
imb = imopen(imb, ones(3));
subplot(h, w, i); i = i + 1;
imshow(imb);

imz = imbinarize(im);

%dylatacja na erozji
% imb = imerode(imb, ones(3));
% imb = imdilate(imb, ones(3));
imclose(imz, ones(3));
subplot(h, w, i); i = i + 1;
imshow(imz);


%erozja, potem dylatacja wykonuje funkcja imopen(imb, ones(3))
%tzw zamkniecie czyli dylatacja, potem erozja: imclose
%fspecial inne filtry!

