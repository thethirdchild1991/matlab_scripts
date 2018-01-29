% clc;
% clear;
% close all;

% path = 'D:\work\GSPV\DEBUG_IMAGES\PHOTOS_01_15\';
path = 'D:\work\REPOS\camera-gs-polivektris\bin\x86\release\result\';
files = dir([path '*.*']);
files_num = length(files);

filename = 'D:\work\GSPV\DEBUG_IMAGES\PHOTOS_01_15\image_38.png';

show_img = 0;
show_hist = 0;
show_plane = 1;

for i = 3:files_num
    
    filename = [path files(i).name];
    img = imread( filename );
    hsv = rgb2hsv(img);
    if(show_img == 1)
        figure;
        imshow(img);    
    end

    [Hh Hx] = imhist(hsv(:,:,1));    
    [Sh Sx] = imhist(hsv(:,:,2));    
    [Vh Vx] = imhist(hsv(:,:,3));

    if(show_hist == 1)
        figure;
        subplot(3,1,1);
        plot(Hx(2:end)*180,Hh(2:end), '-x');
        grid on;
        title('H hist');
        subplot(3,1,2);
        plot(Sx(2:end),Sh(2:end), '.');
        grid on;
        title('S hist');
        subplot(3,1,3);
        plot(Vx(2:end),Vh(2:end), '.');
        grid on;
        title('V hist');
    end
    
    if(show_plane == 1) 
        subplot(2,2,1);
        imshow(hsv(:,:,1));        
        title('H plane');
        subplot(2,2,2);
        imshow(img);
        title(i);
        
        cov_res = cov(hsv(:,:,1));
        diag_res = diag(cov_res);
        sko = sqrt(diag_res);
        
        subplot(2,2,3);
        plot(sko*180, '-x');
        grid on;
        title('SKO');
        subplot(2,2,4);
        plot(mean(hsv(:,:,1))*180, '-x');
        grid on;
        title('MEAN');
        while waitforbuttonpress == 0
        end
    end
    
    
    

end