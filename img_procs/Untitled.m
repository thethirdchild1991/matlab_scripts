clc;
clear;
close all;




% A = imread('frame_1026_091714.bmp');
% A = imread('frame_1031_121703.bmp');
% A = imread('frame_1031_111616.bmp');
% A = imread('frame_1102_171429.bmp');
A = imread('frame_my_1.bmp');
A = A(100:940,540:1700,1);
imshow(A);
for i = 1:4
    line = double(A(:,398+i));
    der = diff(line);
    figure;
    plot(1:841, line/max(line),'-');
%     plot(1:600, line/max(line),'-', 1:600-1, der/max(der));
    pause(0.3);
end

% step0: column max = 0;
% step1: get pix value cmp with Column max
% step2: store pix value if pix>= column max, column max = pix value, rising edge found = 1
% step3: if pix value < 0.75column max, stop store, faling edge found = 1, peak found  = 1
% step4: if peak found = 1  then calc peak energy
% step5: if energy < then thresold, reset peak
% step6: if we have more then 1 peak, cmp peaks and save the biggest one
% step7 COG the biggest peak;    
    


% imshow(A);


for k = 1:1
A_tresholded = double(A) ;
m_profile = zeros(1,800);
m_energy = zeros(1,800);
m_width = zeros(1,800);
m_profile(1,1) = 200;
m_profile(1,800) = 400;
% figure;
% plot(A_tresholded(:,405+k));
% title(405+k);

for i = 1:800
    
    m_numer = double(0);
    m_denom = double(0);
    m_peak_n = m_numer;
    m_peak_d = m_denom;
    rising = 0;
    faling = 0;
    peak_width = 0;
    for j = 1:600
        if(A_tresholded(j,i) > 0)
            m_numer = m_numer + A_tresholded(j,i)*j;
            m_denom = m_denom + A_tresholded(j,i);
        end
        if(A_tresholded(j,i) > 0 && rising == 0);
            rising = j;
        end
        if(A_tresholded(j,i) == 0);
            faling = j;
        end
        if(A_tresholded(j,i) == 0)
            if(m_denom > m_peak_d)
%                 if((faling - rising) > 1 )
                    m_peak_n = m_numer;
                    m_peak_d = m_denom;
                    peak_width = faling - rising;

%                 end
            end
            risnig = 0;
            faling = 0;
            m_numer = 0;
            m_denom = 0;
        end
    end
    m_profile(1,i) = double(m_peak_n/m_peak_d);
    m_energy(1,i) = m_peak_d;
    m_width(1,i) = peak_width;
    
%     figure;
%     plot(A_tresholded(:,i));
%     title(i);
%     pause(0.1);
end


% figure;
% imshow(A);
% figure;
% imshow(uint8(A_tresholded));
% figure;
% imshow(A_tresholded > 0);
% figure;
% plot(m_profile);
% figure(h);
% subplot(10,uint(k/2)+1,mod(k,2));
% imshow(A_tresholded > 0);

% figure;
% % subplot(1,2,1);
% 
% % m_profile = m_profile .* (m_energy > 20);
% plot(1:800,m_profile(1:800)/max(m_profile(1:800))*max(sum(A_tresholded)),'.',1:800, m_energy(1:800));
% figure;
% plot(1:800, m_width);
% 
% figure;
% plot(A_tresholded(:,206));


% figure;
% plot(A_tresholded(:,432));
% subplot(1,2,2);
% plot(sum(A_tresholded));

end

figure;
plot(m_profile,'.');

grid on;