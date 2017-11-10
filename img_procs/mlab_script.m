clc;
clear;
close all;

files = dir('D:/work/GSPV/src/camera-gc-polivektris/bin/x86/release/result/white/*.jpg');
files_num = length(files);

res = zeros(5,files_num);
for i = 1: files_num
    m_tmp = strsplit(files(i).name, {'_', '.'});    
    
    res(1,i) = str2num(cell2mat(m_tmp(2)));%file number
    res(2,i) = str2num(cell2mat(m_tmp(3)));%300-B-G-R
    res(3,i) = 100-str2num(cell2mat(m_tmp(4)));%B
    res(4,i) = 100-str2num(cell2mat(m_tmp(5)));%G
    res(5,i) = 100-str2num(cell2mat(m_tmp(6)));%R
end

figure;
plot(res(1,:),res(2,:),'.');
grid on;
title('300-B-G-R');

figure;
plot(res(1,:),res(3,:)./res(2,:),'.');
grid on;
title('B');


figure;
plot(res(1,:),res(4,:)./res(2,:),'.');
grid on;
title('G');

figure;
plot(res(1,:),res(5,:)./res(2,:),'.');
grid on;
title('R');