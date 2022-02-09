clear; clc;close all;
im = imread('zubr.jpg');
im = double(im)/255;
%  figure;
%  imhist(im);

x = linspace(0,1,256);
figure;
%imshow(rgb2gray(1 - im));
%imhist(rgb2gray(im));
%     x = 0 : 1/255 : 1;
%     y = 1-x;
%     y(y>1) = 1;
%     y(y<0) = 0;
%     
%     plot(y,x);
%     ylim([0,1]);

% subplot(h, w, i); i = i+1;
%imshow(im)

%czerwony
%  im(:,:,[2,3]) = 0;
% % subplot(h, w, i); i = i+1;
% % imshow(im);
% % subplot(h, w, i); i = i+1;
% imhist(im(:,:,1));

% figure;
%zielony
% im(:,:,[1,3]) = 0;
% subplot(h, w, i); i = i+1;
% % imshow(im);
% imhist(im(:,:,2));

% figure;
%niebieski
%  im(:,:,[1,2]) = 0;
% subplot(h, w, i); i = i+1;
% imshow(im);
% imhist(im(:,:,3));

% imm = im;
% imm(:,:,1) = 0;
% subplot(h, w, i); i = i+1;
% imshow(imm);

% subplot(h, w, i); i = i+1;
% imshow(im(:,:,1))
% subplot(h, w, i); i = i+1;
% imhist(im(:,:,1))
% 
% subplot(h, w, i); i = i+1;
% imshow(im(:,:,2))
% subplot(h, w, i); i = i+1;
% imhist(im(:,:,2))
% 
% subplot(h, w, i); i = i+1;
% imshow(im(:,:,3))
% subplot(h, w, i); i = i+1;
% imhist(im(:,:,3))

% for j = 1:3
%     subplot(h, w, i); i = i+1;
%     imshow(im(:,:,j))
%     subplot(h, w, i); i = i+1;
%     imhist(im(:,:,j))
% end

% 
 %img = mean(im, 3);
% subplot(h, w, i); i = i+1;
%     imshow(img)
%     subplot(h, w, i); i = i+1;
    %imhist(img)
% 
%      YUV = [.299,.587,.114];
%      YUV = permute(YUV, [1,3,2]);
% %     
%      img = im.* YUV;
%      img = sum(img,3);
% %     subplot(h, w, i); i = i+1;
% %     imshow(img)
% %     subplot(h, w, i); i = i+1;
%      imhist(img);
%     
    %jasnosc
%     im = rgb2gray(im);
%     b = .2;
%     imb = im + b;
%     imb(imb>1) = 1;
%     imb(imb<0) = 0;
%     figure;
    %subplot(h, w, i); i = i+1;
   % imshow(imb)
    %subplot(h, w, i); i = i+1;
   % imhist(imb);
% %     
% %     
%     x = 0 : 1/255 : 1;
%     y = x+b;
%     y(y>1) = 1;
%     y(y<0) = 0;
%     
%     plot(x,y);
%     ylim([0,1]);
%    
    %kontrast
%    c = .5;
%     imc = im * c;
%     imc(imc > 1) = 1;
    
    %subplot(h, w, i); i = i+1;
    %imshow(imc)
    %subplot(h, w, i); i = i+1;
%     imhist(imc)
%     
%     x = 0 : 1/255 : 1;
%     y = x*c;
%     y(y>1) = 1;
%     y(y<0) = 0;
%     
%     plot(x,y);
%     
%     %projekcja gamma
    g = 2;
     imga = im.^g;
%     subplot(h, w, i); i = i+1;
%     imshow(imga)
%     subplot(h, w, i); i = i+1;
     imhist(imga)
%     
%     x = 0 : 1/255 : 1;
%     y = x.^g;
%     y(y>1) = 1;
%     y(y<0) = 0;
%     
%     plot(x,y);
%     
