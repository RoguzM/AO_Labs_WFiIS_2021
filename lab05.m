clear; clc;
close all;

im = double(imread('kaczki.jpg'))/255;
im = rgb2gray(im);
im = imbinarize(1-im);

%operacja zamkniecia, kaczki spojne (tlo czarne, kaczki biale)
im = imclose(im, ones(12));
%imshow(im);

%sam obrys kaczki, w srodku wypelniona // inne polecenia erode, open, fill,
%clean
%im = bwmorph(im, 'erode');
%imshow(im);

%szkielet kaczki, mozna fajne funkcje wywolac
%imc = bwmorph(im, 'skel', Inf);
%imshow(imc);

%punkty koncowe szkieletu
%imc = bwmorph(imc, 'endpoints');
%imshow(imc);

%cos aka wezly, z ktorych odchodza galezie (punkty przeciecia linii
%szkieletu)
%imc = bwmorph(imc, 'branchpoints');
%imshow(imc);

%redukuje szkielet do punktu (srodek masy obiektu)
%imc = bwmorph(imc, 'shrink', Inf);
%imshow(imc);

% %redukujemy do krzywych (odcinkow)
 %imd = bwmorph(im, 'thin', 20);
 %imshow(imd);

%pogrubiamy (dylatacja, ktora zachowuje granice miedzy obiektami
 %imd = bwmorph(im, 'thicken', 15);
 %imshow(imd);

%oznacza etykietami kazdy obiekt, 
 %imb = bwlabel(im);
 %imshow(label2rgb(imb));

%imb == 3 wyrysuje tylko obiekt o 3
%etykiecie
 %imb = bwlabel(im);
 %imshow(label2rgb(imb == 2));

 %maska (jedna kaczucha)
 %kaczka = double(imread('kaczki.jpg'))/255;
 %imshow((imb == 2).*kaczka);
 
 %segmentowanie kaczek i wyswietlenie ich pojedynczo
  %seg = bwmorph(im, 'thicken', Inf);
  %l = bwlabel(seg);
  %imshow((l == 2).*kaczka);
  %imshow(label2rgb(l));

 %transformacja odleglosciowa
 d = bwdist(im);
 imshow(d, [0, max(d, [], 'all')]);
 
 l = watershed(d);
 
 imshow(label2rgb(l));
