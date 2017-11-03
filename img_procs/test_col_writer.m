clc;
clear;
close all;

files = dir('video_frames/*.bmp');
files_num = length(files);

A = imread(['video_frames/' files(511).name]);

[h w] = size(A);    
col_num = 485;

figure;
imshow(A);
figure;
plot(A(:,col_num ));

fileID = fopen('test_column.txt','w');

for i = 1:h
    fprintf(fileID,'%X\n',uint8( A(i,col_num ) ));
end

fclose(fileID);