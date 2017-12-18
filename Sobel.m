clc;
clear all;
close all;
im=imread('../Raw data/data3.png');
im1=rgb2gray(im);
im1=medfilt2(im1,[3 3]); %Median filtering the image to remove noise%
BW = edge(im1,'sobel'); %finding edges 
[imx,imy]=size(BW);
msk=[0 0 0 0 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 0 0 0 0;];
B=conv2(double(BW),double(msk)); %Smoothing  image to reduce the number of connected components
L = bwlabel(B,8);% Calculating connected components
mx=max(max(L))

[r,c] = find(L==17);  
rc = [r c];
[sx sy]=size(rc);
n1=zeros(imx,imy); 
for i=1:sx
    x1=rc(i,1);
    y1=rc(i,2);
    n1(x1,y1)=255;
end % Storing the extracted image in an array
figure,imshow(im);
figure,imshow(im1);
figure,imshow(B);
figure,imshow(n1,[]);

