clc;
clear;
close all;

files = dir('E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\*.jpg');
files_num = length(files);

res = zeros(8,files_num);
B = 2;
G = 3;
R = 4;

H = 5;
S = 6;
V = 7;

MAX_VAL = 8;

for i = 1: files_num
    m_tmp = strsplit(files(i).name, {'_', '.'});    
%     [n m] = size(m_tmp);
%     if(m > 5)
%         res(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
%         if (strcmp(m_tmp(4), 'S'))
%             res(2,i) = str2num(cell2mat(m_tmp(end-2)));%S
%         end
%         if (strcmp(m_tmp(4),'V'))
%             res(3,i) = str2num(cell2mat(m_tmp(end-2)));%V
%         end
%     end
%     res(3,i) = str2num(cell2mat(m_tmp(end-2)));%H
    res(1,i) = str2num(cell2mat(m_tmp(2)));%file number 
    res(2,i) = str2num(cell2mat(m_tmp(end-1)));%S
%     
%     res(B,i) = str2num(cell2mat(m_tmp(4)));%B
%     res(G,i) = str2num(cell2mat(m_tmp(5)));%G
%     res(R,i) = str2num(cell2mat(m_tmp(6)));%R
%     
%     res(H,i) = str2num(cell2mat(m_tmp(8)));%B
%     res(S,i) = str2num(cell2mat(m_tmp(9)));%G
%     res(V,i) = str2num(cell2mat(m_tmp(10)));%R
% %     res(6,i) = str2num(cell2mat(m_tmp(6)));%MAX VAL
%     res(MAX_VAL,i) = max(res(2:3,i));
end


figure;
plot(res(1,:),res(2,:),'.');
grid on;
title('S val');

% figure;
% plot(res(1,:),res(3,:),'.');
% grid on;
% title('V val');


% figure;
% plot(res(1,:),res(3,:),'.');
% grid on;
% title('PIX cnt');

% figure;
% plot(res(1,:),res(2,:),'.');
% grid on;
% title('WHITE AREA TO OBJECT AREA');

% figure;
% plot(res(1,:),res(B,:) + res(G,:) + res(R,:),'.');
% grid on;
% title('B+G+R');

% figure;
% plot(res(1,:),3 - res(3,:)./res(7,:) - res(4,:)./res(7,:) - res(5,:)./res(7,:),'.');
% grid on;
% title('300-B-G-R');


% figure;
% plot(res(1,:),res(3,:)./res(7,:),'.');
% grid on;
% title('B');
% 
% 
% figure;
% plot(res(1,:),res(4,:)./res(7,:),'.');
% grid on;
% title('G');
% 
% figure;
% plot(res(1,:),res(5,:)./res(7,:),'.');
% grid on;
% title('R');
%  
% % figure;
% % plot(res(1,:),res(6,:),'.');
% % grid on;
% % title('MAX VAL');
% % 
% figure;
% plot(res(1,:),res(3,:)./res(5,:),'.' );
% grid on;
% title('B / R');
% 
% figure;
% plot(res(1,:),res(3,:)./res(4,:),'.' );
% grid on;
% title('B / G');
% 
% figure;
% plot(res(1,:),res(5,:)./res(4,:),'.' );
% grid on;
% title('R / G');

% figure;
% plot(res(1,:),res(H,:),'.' );
% grid on;
% title('H');
% 
% figure;
% plot(res(1,:),res(S,:),'.' );
% grid on;
% title('S');
% 
% figure;
% plot(res(1,:),res(V,:),'.' );
% grid on;
% title('V');