clear; clc;
close all;

im = double(imread('ptaki2.jpg'))/255;

imc = imbinarize(im(:,:,3));
im = ~imc;
im = imclose(im, ones(10));
imshow(im);

a=regionprops(im,'all');
a(1).Image;
a = regionprops(im,'all');
fun =  {@AO5RBlairBliss, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape};
M = zeros(length(a), length(fun));

for i =1:length(a)
    for j = 1:length(fun)
        M(i,j) =  fun{j}(a(i).Image);
    end
end

for i = 1 : length(M)
    Area(i) = a(i).Area; 
end

out = Area < 700;

M2 = M(out, :);
M(out, :)=[];

%======================================================
im2=imread('ptoki.jpg');
imr2=imbinarize(im2(:,:,1));
imr21=imbinarize(im2(:,:,3));
im2=~imr21|imr2;
im2=imclose(im2,ones(15));
a2=regionprops(im2,'all');
a2(1).Image;
a2 = regionprops(im2,'all');

M3 = zeros(length(a2), length(fun));
for i =1:length(a2)
    for j = 1:length(fun)
        M3(i,j) =  fun{j}(a2(i).Image);
    end
end

in=[M',M2',M3'];
out=[repmat([1;0;0],[1,7]),repmat([0;1;0],[1,5]),repmat([0;0;1],[1,8])];
nn=feedforwardnet;
nn=train(nn,in,out);

%projekt = dokumentacja, kod, dane
%dokumentacja- jak to uruchomic
%dokumentacja- obsluga, opis tematu, co kto robil, co nie dziala
%czas: 2 miesiace
%do 27 stycznia 


