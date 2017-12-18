clc;
clear all;
close all;
img1 = 255 - rgb2gray(imread('C:\\Users\\akumar47\\Dropbox\\Courses\\ECSE 512 - DSP\\Project\\Raw data\\eight_1.png'));
img2 = 255 - rgb2gray(imread('C:\\Users\\akumar47\\Dropbox\\Courses\\ECSE 512 - DSP\\Project\\Raw data\\eight_2.png'));
img3 = 255 - rgb2gray(imread('C:\\Users\\akumar47\\Dropbox\\Courses\\ECSE 512 - DSP\\Project\\Raw data\\two_1.png'));
img4 = 255 - rgb2gray(imread('C:\\Users\\akumar47\\Dropbox\\Courses\\ECSE 512 - DSP\\Project\\Raw data\\two_2.png'));

subplot(2,2,1)
imshow(img1)
title('(a) Sample 1')
subplot(2,2,2)
imshow(img2)
title('(b) Sample 2')
subplot(2,2,3)
imshow(img3)
title('(c) Sample 3')
subplot(2,2,4)
imshow(img4)
title('(d) Sample 4')

correl12 = corr2(img1,img2);
correl13 = corr2(img1,img3);
correl14 = corr2(img1,img4);
correl23 = corr2(img2,img3);
correl24 = corr2(img2,img4);
correl34 = corr2(img3,img4);

correl12 = sum(sum(img1==img2))*100/(28*28)
correl13 = sum(sum(img1==img3))*100/(28*28)
correl14 = sum(sum(img1==img4))*100/(28*28)
correl23 = sum(sum(img2==img3))*100/(28*28)
correl24 = sum(sum(img2==img4))*100/(28*28)
correl34 = sum(sum(img3==img4))*100/(28*28)

