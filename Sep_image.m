close all;
clc;
clear all;
a = im2double(rgb2gray(imread('C:\Users\akumar47\Dropbox\Courses\ECSE 512 - DSP\Project\Raw data\data3.png')));
startx = 0;
starty = 1;
endx = 0;
endy = 0;
[x y] = size(a)
flag = 1;
names_count = 1;
while(starty<y)
    
    for i=starty:y
       if(sum(a(:,i))~=x && flag==1)
           starty = i;
           flag = 0;
       end
       if(sum(a(:,i))==x && flag == 0)
           endy = i;
           flag = 2;
           break;
           
       end
    end
    
    if(flag == 2)
        figure()
        image = a(:,starty:endy);
        [sx sy] = size(image);
        subplot(1,2,1);
        imshow(image);
        
        %downsampling to 28*28
        subplot(1,2,2)
        new_image = ones(28,28);
        if(sx<=28 && sy<=28)
            idx = floor((28-sx)/2);
            idy = floor((28-sy)/2);
            new_image(idx+1:idx+nsx,idy+1:idy+nsy) = image;
        elseif(sx<=28 && sy>28)
            
            D  = ceil(sy/28);
            image_cp = image(:,1:D:sy);
            [nsx nsy] = size(image_cp);
            idx = floor((28-nsx)/2);
            idy = floor((28-nsy)/2);
            new_image(idx+1:idx+nsx,idy+1:idy+nsy) = image_cp;
            
        elseif(sx>28 && sy<=28)
            
            D  = ceil(sx/28);
            image_cp = image(1:D:sx,:);
            [nsx nsy] = size(image_cp);
            idx = floor((28-nsx)/2);
            idy = floor((28-nsy)/2);
            new_image(idx+1:idx+nsx,idy+1:idy+nsy) = image_cp;
            
        else
            D1  = ceil(sx/28);
            D2  = ceil(sy/28);
            image_cp = image(1:D1:sx,1:D2:sy);
            [nsx nsy] = size(image_cp);
            idx = floor((28-nsx)/2);
            idy = floor((28-nsy)/2);
            new_image(idx+1:idx+nsx,idy+1:idy+nsy) = image_cp;
        end
        subplot(1,2,2);
        z(:,:,1) = new_image;
        z(:,:,2) = ones(28,28);
        z(:,:,3) = ones(28,28);
        imshow(z);
        
        imwrite(z,['C:\Users\akumar47\Dropbox\Courses\ECSE 512 - DSP\Project\Resized Images\image_' num2str(names_count) '.png']);
        names_count = names_count+1;
%         for i = 1:sx/3
%             new_image(i,:) = image(3*i,:);
%         end   
%         size(new_image)
%         imshow(new_image)
        %end of downsampling         
        
        %updating the variables only when an end position was found
        starty = endy+1;
        endy = 0;
        flag = 1;
    else
        starty = starty+1;
    end
end