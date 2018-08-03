clc;
clear;
close all;

files = dir('E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\all\SPEC\*.jpg');

files_old_big = dir('E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\all\OLD_05_03_06_14\BORG_LBLUE\*.jpg');
files_new_big = dir('E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\all\NEW_05_03_06_14\BORG_LBLUE\*.jpg');

files_new_1_big = dir('E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\all\NEW_1_05_03_06_14\BORG_LBLUE\*.jpg');

files_old = dir('E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\all\OLD_06_22\BORG_LBLUE\*.jpg');
files_new = dir('E:\work\ARDEONOVA\REPOS\camera-gs-polivektris\bin\x86\release\result\all\NEW_06_22\BORG_LBLUE\*.jpg');

files_num = length(files);
files_num_old_big = length(files_old_big);
files_num_new_big = length(files_new_big);
files_num_new_1_big = length(files_new_1_big);
files_num_old = length(files_old);
files_num_new = length(files_new);


res = zeros(8,files_num_old_big);
res_old_big = zeros(8,files_num_old_big);
res_new_big = zeros(8,files_num_new_big);
res_new_1_big = zeros(8,files_num_new_1_big);

res_old = zeros(8,files_num_old);
res_new = zeros(8,files_num_new);
B = 2;
G = 3;
R = 4;

H = 5;
S = 6;
V = 7;

WHITE = 8;
MASK_SIZE = 8
MAX_VAL = 8;


HIST_WIDTH = 4;


for i = 1: files_num
    m_tmp = strsplit(files(i).name, {'_', '.'});    
    
    res(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
    res(H,i) = str2num(cell2mat(m_tmp(4)));%H
    res(S,i) = str2num(cell2mat(m_tmp(5)));%S
    res(V,i) = str2num(cell2mat(m_tmp(6)));%V
    res(MASK_SIZE,i) = str2num(cell2mat(m_tmp(7)));%MASK_SIZE
end




for i = 1: files_num_old_big
    m_tmp = strsplit(files_old_big(i).name, {'_', '.'});    
    
    res_old_big(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
    res_old_big(H,i) = str2num(cell2mat(m_tmp(4)));%H
    res_old_big(S,i) = str2num(cell2mat(m_tmp(5)));%S
    res_old_big(V,i) = str2num(cell2mat(m_tmp(6)));%V

end

for i = 1: files_num_new_big
    m_tmp = strsplit(files_new_big(i).name, {'_', '.'});    
    
    res_new_big(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
    res_new_big(H,i) = str2num(cell2mat(m_tmp(4)));%H
    res_new_big(S,i) = str2num(cell2mat(m_tmp(5)));%S
    res_new_big(V,i) = str2num(cell2mat(m_tmp(6)));%V

end

for i = 1: files_num_new_1_big
    m_tmp = strsplit(files_new_1_big(i).name, {'_', '.'});    
    
    res_new_1_big(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
    res_new_1_big(H,i) = str2num(cell2mat(m_tmp(4)));%H
    res_new_1_big(S,i) = str2num(cell2mat(m_tmp(5)));%S
    res_new_1_big(V,i) = str2num(cell2mat(m_tmp(6)));%V

end




for i = 1: files_num_old
    m_tmp = strsplit(files_old(i).name, {'_', '.'});    
    
    res_old(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
    res_old(H,i) = str2num(cell2mat(m_tmp(4)));%H
    res_old(S,i) = str2num(cell2mat(m_tmp(5)));%S
    res_old(V,i) = str2num(cell2mat(m_tmp(6)));%V

end

for i = 1: files_num_new
    m_tmp = strsplit(files_new(i).name, {'_', '.'});    
    
    res_new(1,i) = str2num(cell2mat(m_tmp(2)));%file number    
    res_new(H,i) = str2num(cell2mat(m_tmp(4)));%H
    res_new(S,i) = str2num(cell2mat(m_tmp(5)));%S
    res_new(V,i) = str2num(cell2mat(m_tmp(6)));%V

end


% figure;
% plot(res_old_big(1,:), res_old_big(H,:), 'x');
% grid on;
% title('H at old big')
% 
% 
% figure;
% plot(res_new_big(1,:), res_new_big(H,:), 'x');
% grid on;
% title('H at new big')
% 
% figure;
% plot(res_old(1,:), res_old(H,:), 'x');
% grid on;
% title('H at old')
% 
% 
% figure;
% plot(res_new(1,:), res_new(H,:), 'x');
% grid on;
% title('H at new')

figure;
plot(res(H,:), res(S,:), 'x');
grid on;
title('S(H) all')

figure;
plot(res(1,:), res(MASK_SIZE,:), 'x');
grid on;
title('MASK SIZE')

figure;
plot(res(H,:), res(MASK_SIZE,:), 'x');
grid on;
title('MASK SIZE(H) all')


% figure;
% plot(res(H,:), res(V,:), 'x');
% grid on;
% title('V(H) all')
% 
% figure;
% plot(res(1,:), res(S,:), 'x');
% grid on;
% title('S(im num) all')


% figure;
% plot(res_new(H,:), res_new(S,:), 'x');
% grid on;
% title('S(H) new')
% 
% 
% figure;
% plot(res_old(H,:), res_old(S,:), 'x');
% grid on;
% title('S(H) old')
% 
% figure;
% plot(res_new_big(H,:), res_new_big(S,:), 'x');
% grid on;
% title('S(H) new big')
% 
% 
% figure;
% plot(res_new_1_big(H,:), res_new_1_big(S,:), 'x');
% grid on;
% title('S(H) new 1 big')
% 
% 
% figure;
% plot(res_old_big(H,:), res_old_big(S,:), 'x');
% grid on;
% title('S(H) old big')
