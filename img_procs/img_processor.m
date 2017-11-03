clc;
clear;
close all;
files = dir('video_frames/*.bmp');

do_img_proc = 1;
do_draw_profile = 1;
do_pause = 0;
drow_single_line = 1;

files_num = length(files);
profile = zeros(files_num,1600);

from = 511;
to = 511;
step = 1;


if (do_img_proc == 1)
    for k = from : step : to;
        A = imread(['video_frames/' files(k).name]);


    %     imshow(A);

        [h w] = size(A);    



        for i = 1:w
            numer = 0;
            denomer = 0;
            peak_numer = 0;
            peak_denomer = 0;
            rising = 0;
            falling = 0;
            for j = 1:h
                numer = numer + double(A(j,i))*j;
                denomer = denomer + double(A(j,i));

                if( A(j,i) > 0 && rising == 0 )
                    rising = j;
                end
                if( A(j,i) == 0 && falling == 0 && rising ~= 0 )
                   falling = j;    
                   if (i == 437)
                       
                   end
                end
                if(A(j,i) == 0)                    
                    if(denomer > peak_denomer)
                        peak_denomer = denomer;
                        peak_numer = numer;
                    end
                    numer = 0;
                    denomer = 0;
                    rising = 0;
                    falling = 0;
                end

            end
            if(peak_denomer < 20)
                peak_denomer = 0;
                peak_numer = 0;
            end
            profile(k,i) = double(peak_numer/peak_denomer);
        end

        k
    end
end
% pause on;

if (do_draw_profile == 1)
    for k = from:step:to
        A = imread(['video_frames/' files(k).name]);
        
        [h w] = size(A);
        subplot(2,1,1);
        plot(profile(k,1:w), '.');
        subplot(2,1,2);
        imshow(A);
        title(k);    

        if (do_pause == 1)
            while waitforbuttonpress == 0
            end
        end
    end
end


if (drow_single_line == 1)
    col_from = 485;
    col_step = 1;
    col_to = 485;
    
    for k = from:step:to
        A = imread(['video_frames/' files(k).name]);
        
        figure;
        imshow(A);
        figure;
        for j = col_from : col_step : col_to
            line = double(A(:,j));

            rising = 0;
            rising_draw = zeros(1,length(line));
            falling = 0;
            falling_draw = zeros(1,length(line));
            denom = 0;
            denom_draw = zeros(1,length(line));

            for i = 1:length(line);
                denom = denom + line(i);
                if((line(i) > 0) && (rising == 0) )
                    rising = i;
                    rising_draw(i) = 255;
                    falling = 0;
                end
                if((line(i) == 0 )&&( rising ~= 0 )&&( falling == 0))
                    falling = i;
                    falling_draw(i) = 255;
                    rising = 0;
                end
                if(falling ~= 0)
                    denom = 0;
                end
                denom_draw(i) = denom;
            end
            
%             plot(1:length(line),line,'-',1:length(rising_draw),rising_draw, 1:length(falling_draw), falling_draw,1:length(denom_draw),denom_draw);
            der1 = [0; diff(line)];
            der2 = [0; diff(der1)];
%             plot(1:length(line),line/max(line), 1:length(result), result/max(result) );

%             plot(1:length(line), line, 1:length(der2), der2);
            marker = zeros(1,length(line));
            marker(floor(profile(k,j))) = line(floor(profile(k,j)));
            
            plot(1:length(line), line, 1:length(line), marker, 'x');
            title(j);
            if (do_pause == 1)
                while waitforbuttonpress == 0
                end
            end
        end
    end
end




'finish'
