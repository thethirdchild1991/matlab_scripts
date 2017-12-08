clc;
clear;
close all;

files = dir('D:\work\REPOS\camera-gs-polivektris\bin\x86\release\result\*.jpg');
files_num = length(files);

res = zeros(7,files_num);
for i = 1: files_num
    m_tmp = strsplit(files(i).name, {'_', '.'});    
%     res(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
%     res(2,i) = str2num(cell2mat(m_tmp(end-1)));%SAT to SIZE    
    res(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
    res(3,i) = str2num(cell2mat(m_tmp(end - 3)));%B
    res(4,i) = str2num(cell2mat(m_tmp(end - 2)));%G
    res(5,i) = str2num(cell2mat(m_tmp(end - 1)));%R
%     res(6,i) = str2num(cell2mat(m_tmp(6)));%MAX VAL
    res(7,i) = max(res(3:5,i));
end



% figure;
% plot(res(1,:),res(2,:),'.');
% grid on;
% title('WHITE AREA TO OBJECT AREA');


% figure;
% plot(res(1,:),3* - res(3,:),'.');
% grid on;
% title('300-B-G-R');


figure;
plot(res(1,:),res(3,:)./res(7,:),'.');
grid on;
title('B');


figure;
plot(res(1,:),res(4,:)./res(7,:),'.');
grid on;
title('G');

figure;
plot(res(1,:),res(5,:)./res(7,:),'.');
grid on;
title('R');
 
% figure;
% plot(res(1,:),res(6,:),'.');
% grid on;
% title('MAX VAL');
% 
figure;
plot(res(1,:),res(3,:)./res(5,:),'.' );
grid on;
title('B / R');

figure;
plot(res(1,:),res(3,:)./res(4,:),'.' );
grid on;
title('B / G');

figure;
plot(res(1,:),res(5,:)./res(4,:),'.' );
grid on;
title('R / G');