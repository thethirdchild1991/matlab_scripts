clc;
clear;
close all;

do_single_plot = 1;
path = 'E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\'
files = dir([path '*.jpg']);
files_num = length(files);

if do_single_plot == 1
    for i = 1:1
        close all;
img = imread( ['D:\work\REPOS\camera-gs-polivektris\bin\x86\release\result\VAL_more_240\SAT_less_10\img_528_UNDEF_31_2_252.jpg' ]);    
        hsv = rgb2hsv(img);
        imshow(img);    

        [Hh Hx] = imhist(hsv(:,:,1));    
        [Sh Sx] = imhist(hsv(:,:,2));    
        [Vh Vx] = imhist(hsv(:,:,3));

        figure;
        subplot(3,1,1);
        plot(Hx(2:end)*360,Hh(2:end), '-');
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


        figure;
        subplot(5,1,1);
        plot(Hx(2:end)*360,Hh(2:end), '-');
        grid on;
        title('H hist');

        subplot(5,1,2);
        plot(Hx(1:end)*360, medfilt1(Hh(1:end),3), '.');
        title('H hist MEDIAN');
        grid on;

        subplot(5,1,3);
        plot(Hx(1:end)*360, smooth(medfilt1(Hh(1:end),3),3), '.');
        grid on;
        title('H smooth');

        subplot(5,1,4);
        plot(Hx(1:end-1)*360, diff(smooth(medfilt1(Hh(1:end),3),3)));
        grid on;
        title('H diff');

        subplot(5,1,5);
            [peaks loc] = findpeaks(smooth(medfilt1(Hh(1:end),3),3));

        plot(loc, peaks, 'x');
        grid on;
        title('H diff 2');

        figure;
        [X, Y ] = size(hsv(:,:,1));
        mesh(hsv(:,:,2));
    end
else
    res = zeros(2,files_num);
    
    
    for i = 1:files_num
        m_tmp = strsplit(files(i).name, {'_', '.'});    
        files(i).name
        img = imread( [path files(i).name] );    
        hsv = rgb2hsv(img);          

        [Hh Hx] = imhist(hsv(:,:,1));    
        [Sh Sx] = imhist(hsv(:,:,2));    
        [Vh Vx] = imhist(hsv(:,:,3));
        
        Hh_median = medfilt1(Hh(1:end),3);
        Hh_median_smoothed = smooth(medfilt1(Hh(1:end),3),3);
        Hh_median_smothed_diff = diff(smooth(medfilt1(Hh(1:end),3),3));
        [peaks loc] = findpeaks(Hh_median_smoothed);
        
%         xcorr
        
        [C I] = max(Hh_median_smoothed);
        test_signal = Hh_median_smoothed(I-10:I+10);
        sig_diff = test_signal - test_signal(end:-1:1);
        
        figure;
        subplot(2,1,1);
        plot(Hh_median_smoothed);
        subplot(2,1,2);
        plot(sig_diff);

        res(1,i) = str2num(cell2mat(m_tmp(2)));%file number      
        peaks_num = size(peaks);
        res(2,i) = peaks_num(1);
        i
    end
    
    figure;
    plot(res(1,:),res(2,:), '.');
    grid on;
end