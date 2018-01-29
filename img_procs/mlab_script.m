clc;
clear;
close all;

files = dir('D:\work\REPOS\camera-gs-polivektris\bin\x86\release\result\SEVERAL\*.jpg');
files_num = length(files);

res = zeros(8,files_num);
B = 2;
G = 3;
R = 4;

H = 5;
S = 6;
V = 7;

WHITE = 8;

MAX_VAL = 8;

for i = 1: files_num
    m_tmp = strsplit(files(i).name, {'_', '.'});    
    [n m] = size(m_tmp);
     if(m >= 5)
        res(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
        res(2,i) = str2num(cell2mat(m_tmp(4)));%file number    
     end
%     res(3,i) = str2num(cell2mat(m_tmp(end-2)));%H
%     res(1,i) = str2num(cell2mat(m_tmp(2)));%file number 
%     res(2,i) = str2num(cell2mat(m_tmp(end-1)));%S
%     res(2,i) = str2num(cell2mat(m_tmp(end-1)));%S
%     
%     res(B,i) = str2num(cell2mat(m_tmp(4)));%B
%     res(G,i) = str2num(cell2mat(m_tmp(5)));%G
%     res(R,i) = str2num(cell2mat(m_tmp(6)));%R
%     
%     res(H,i) = str2num(cell2mat(m_tmp(4)));%H
%     res(S,i) = str2num(cell2mat(m_tmp(5)));%S
%     res(V,i) = str2num(cell2mat(m_tmp(6)));%V


%     res(2,i) = str2num(cell2mat(m_tmp(end - 3)));%H
%     res(3,i) = str2num(cell2mat(m_tmp(end - 2)));%S
%     res(4,i) = str2num(cell2mat(m_tmp(end - 1)));%V

%     res(3,i) = str2num(cell2mat(m_tmp(3)));
%     res(4,i) = str2num(cell2mat(m_tmp(4)));

%     
%     res(WHITE,i) = str2num(cell2mat(m_tmp(7)));%V
% %     res(6,i) = str2num(cell2mat(m_tmp(6)));%MAX VAL
%     res(MAX_VAL,i) = max(res(2:3,i));
end

figure;
plot(res(1,:),res(2,:), 'x');
grid on;

