clear all
close all
clc

img= imread('test-img8.pgm');
bins= 256;
ws=[50,50];

[r c]=size(img);        %store size of image

ni=uint8(zeros(r,c));      %initialize a new array of zeros
xreg=ceil(r/ws(1));        %calculate number of regions in which the image can be divided in X and Y direction 
yreg=ceil(c/ws(2));
cdfs=zeros(xreg,yreg,bins);  % initialize an array to store the CDF of each region
minx=1;                      % min and max value corresponding to the initial X co-ordinates of the window
maxx=ws(1);

for i=1:1:xreg;
    miny=1;                   % min and max value corresponding to the initial Y co-ordinates of the window
    maxy=ws(2);
    for j=1:1:yreg;           
        if maxx>r             %restrict window if going outside image
            maxx=r;
        end
        if maxy>c
            maxy=c;
        end
         h=histogram_Ruchika(img(minx:maxx,miny:maxy),bins,0,255);      %generate the histogram for each window
         for k=1:1:bins;
             cdfs(i,j,k)=sum(h(1:k))/(ws(1)*ws(2));             %generate CDF for each window 
         end
         
         miny=miny+ws(2);                                       %move window to next region
         maxy=maxy+ws(2);
    end
    minx=minx+ws(1);
    maxx=maxx+ws(1);
end

a=(255)/(bins-1);

for i=1:1:r;
    for j=1:1:c;
        pv=(img(i,j));
        
        bin=floor(pv/a);
        
        x=(i/ws(1));                    
        xl=floor(x);                       %X region of the pixel
        xr=xl+1;                           %region to right of pixel's region
        
        y=(j/ws(2));
        yt=floor(y);                       %Y region of pixel
        yb=yt+1;                           % region below the pixel's region
        
        if(xl<1);
            xl=1;
        end
        if(xr>xreg);
            xr=xreg;                        % boundary condition check
        end
        if(yt<1);
            yt=1;
        end
        if(yb>yreg);
            yb=yreg;
        end
        
        dxl=x-xl;
        dyt=y-yt;                           %distance of pixel from left and top
        
        i11=(cdfs(xl,yt,bin+1));
        i12=(cdfs(xl,yb,bin+1));            %vales from the four CDFs that will be used for bilinear interpolation
        i21=(cdfs(xr,yt,bin+1));
        i22=(cdfs(xr,yb,bin+1));
        
        
       ipv=(1-dxl)*(1-dyt)*i11+(1-dxl)*dyt*i12+dxl*(1-dyt)*i21+dxl*dyt*i22;  %bilinear interpolation
       ipv=uint8(ipv*255);
       ni(i,j)=ipv;
       
    end
end

figure
imshow(img);


figure
imshow(ni);






        
        
            
           
            
        
        
    
    
