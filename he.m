clear all
close all
clc

img_i= imread('test-img8.pgm');
bins= 256;
min_img=0;
max_img=255;
alpha=1;
                     
img=uint8(img_i);        %convert image to uint8              
a=(max_img-min_img)/(bins);     
a=ceil(a);
ca=zeros(1,bins);             %initialize counter array to zero
m=length(img(:,1));
n=length(img(1,:));
ni=zeros(m,n);

for i=1:1:m*n;
    b=(img(i)/a);
    b=floor(b);
    
        ca(b+1)=ca(b+1)+1;       %increment value of corresponding value of counter array
    
end        

ca=ca/(m*n);                       %normalize the histogram

for i=1:1:m;
    for j=1:1:n;
       d=img(i,j);
        
       bin=floor(d/a);
       ni(i,j)=sum(ca(1:bin));             %Calculate the CDF
  
    end
end

img=double(img);
for i=1:1:m;
    for j=1:1:n;
        img2(i,j)=alpha*(ni(i,j))+(1-alpha)*(img(i,j));         %calculate the value of the pixel using the CDF and the value of Alpha
    end
end

scale_factor=255/max(img2(:));

figure
imshow(img_i);

figure
imshow(uint8(scale_factor.*img2));

figure
histogram(img_i,256);

figure
histogram(img2,256);

        










