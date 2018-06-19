clc;
clear;
close all;

fileID = fopen('E:\work\RIFTEK_IT\020-series\matlab_scripts\dump_viewer\triangle.bin');


magic_value = fread(fileID,1,'uint16');
version_value = fread(fileID,1,'uint16');
dataType_value = fread(fileID,1,'uint16');
measuresType_value = fread(fileID,1,'uint16');
unitType_value = fread(fileID,1,'uint16');
scale_value = fread(fileID,1,'double');
layout_value = fread(fileID,1,'uint16');
stepSize_value = fread(fileID,1,'uint16');

X = zeros(1600,2000);
Y = zeros(1600,2000);
Z = zeros(1600,2000);
for i = 1:2000
    profile_size = fread(fileID,1,'uint32');

    x = zeros(1,profile_size);
    y = zeros(1,profile_size);
    tmp = zeros(1,profile_size*2);

    tmp = fread(fileID,2*profile_size,'int32', 'l');

    x = tmp(1:2:end)/1000;
    y = tmp(2:2:end)/1000;

    X(1:length(x), i) = x(1:end);
    Y(1:length(y), i) = y(1:end);
    Z(1:end,i) = i*10;
    
    plot(x,y,'x');
    grid on;
    title(i);
    
    pause(0.2)
end
% start = 100;
% stop = 2000;
% 
% XX = X(:, start:stop);
% YY = Y(:, start:stop);
% ZZ = Z(:, start:stop);


