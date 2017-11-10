clc;
clear;
close all;
files = dir('video_frames/*.bmp');

do_img_proc = 1;
do_draw_profile = 0;
do_pause = 1;
drow_single_line = 0;
drow_algo_with_max_thresh = 1;

files_num = length(files);
profile = zeros(files_num,1600);
profile2 = zeros(files_num,1600);

from = 21;
to = 21;
step = 10;


if (do_img_proc == 1)
    for k = from : step : to;
        A = imread(['video_frames/' files(k).name]);


    %     imshow(A);

        [h w] = size(A);    
            numer = 0;
            denomer = 0;
            peak_numer = 0;
            peak_denomer = 0;
            rising = 0;
            falling = 0;


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

if(drow_algo_with_max_thresh == 1)    
    for k = from : step : to;
        A = imread(['video_frames/' files(k).name]);
        A = double(A);

    %     imshow(A);

        [h w] = size(A);    



        for i = 1:w
            numer = 0;
            denomer = 0;
            peak_numer = 0;
            peak_denomer = 0;
            rising = 0;
            falling = 0;
                        
            MAX_LINE = double(max(A(:,i)));
%             A(:,i)= A(:,i).*(A(:,i) > MAX_LINE*0.5);
            MAX_LINE = double(max(A(:,i)));
            max_peice = 0;
            
            
            for j = 1:h
                numer = numer + double(A(j,i))*j;
                denomer = denomer + double(A(j,i));

                if( A(j,i) > 0 && rising == 0 )
                    rising = j;
                end
                
                if( A(j,i) > max_peice)
                    max_peice = A(j,i);
                end
                
                if( A(j,i) == 0 && falling == 0 && rising ~= 0 )
                   falling = j;    
%                    max_peice = max(A(rising:falling,i));%%to slow
                end
                if(A(j,i) == 0)                    
%                     if(denomer > peak_denomer && max_peice >= MAX_LINE)
                    if(denomer > peak_denomer)                        
                        peak_denomer = denomer;
                        peak_numer = numer;
                    end
                    numer = 0;
                    denomer = 0;
                    rising = 0;
                    falling = 0;
                    max_peice = 0;
                end

            end
            if(peak_denomer < 20)
                peak_denomer = 0;
                peak_numer = 0;
            end
            profile2(k,i) = double(peak_numer/peak_denomer);
        end

        k
    end
end



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
    col_from = 340;
    col_step = 1;
    col_to = 360;
    
    for k = from:step:to
        A = imread(['video_frames/' files(k).name]);
        
        figure;
        imshow(A);
        figure;
        for j = col_from : col_step : col_to
            line = double(A(:,j));
            
            MAX_LINE = double(max(line))*0.5;
            tresholded_line = line.*(line > MAX_LINE);
            
%             line = tresholded_line;
            
            rising = 0;
            rising_draw = zeros(1,length(line));
            falling = 0;
            falling_draw = zeros(1,length(line));
            denom = 0;
            denom_draw = zeros(1,length(line));
            
            tmp_nom = 0;

            for i = 1:length(line);
                denom = denom + line(i);
                tmp_nom = tmp_nom + line(i)*(i-rising);
                if((line(i) > 0) && (rising == 0) )
                    rising = i;
                    rising_draw(i) = 255;
                    falling = 0;
                end
                if((line(i) == 0 )&&( rising ~= 0 )&&( falling == 0))
                    falling = i;
                    falling_draw(i) = 255;
                    tmp_nom
                    tmp_nom = 0;
                    rising = 0;                    
                end
                if(falling ~= 0)                    
                    denom = 0;
                end
                denom_draw(i) = denom;
            end
            
%             plot(1:length(line),line,'-',1:length(rising_draw),rising_draw, 1:length(falling_draw), falling_draw,1:length(denom_draw),denom_draw,'-');
%             plot(1:length(line),line,'-',1:length(rising_draw),rising_draw, 1:length(falling_draw), falling_draw);
            der1 = [0; diff(line)];
            der2 = [0; diff(der1)];
%             plot(1:length(line),line/max(line), 1:length(result), result/max(result) );

%             plot(1:length(line), line, 1:length(der2), der2);
            marker1 = zeros(1,length(line));
            marker1(floor(profile(k,j))) = line(floor(profile(k,j)));
            marker2 = zeros(1,length(line));
            marker2(floor(profile2(k,j))) = line(floor(profile2(k,j)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%we need only 3,5 or 7 points to calculate peak center
%             MAX_LINE = double(max(line))*0.5;
%             tresholded_line = line.*(line > MAX_LINE);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%            
            plot(1:length(line), line, 1:length(line), marker1, 'x', 1:length(line), marker2,'x');            
%             plot(1:length(line), line,'-', 1:length(line), marker, 'x', 1:length(line), tresholded_line, 'x', 1:length(der1), der1, 1:length(der2), der2);
            grid on;
            title(j);
            if (do_pause == 1)
                while waitforbuttonpress == 0
                end
            end
        end
    end
end



if(drow_algo_with_max_thresh)
    
    figure;
    for k = from:step:to  
        A = imread(['video_frames/' files(k).name]);
        [h w] = size(A);
        
            subplot(2,2,1);
            plot(profile(k,1:w),'.');
            grid on;
            subplot(2,2,2);
            plot(profile2(k,1:w),'.');
            grid on;
            subplot(2,2,3)
            plot(profile(k,1:w) - profile2(k,1:w),'x' );
            grid on;
            subplot(2,2,4);
            imshow(A);
            
            title(k);
            if (do_pause == 1)
                while waitforbuttonpress == 0
                end
            end
    end
end



'finish'
