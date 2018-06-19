clc;
clear;
close all;


% magic_name = 'magic'; 
magic_value = uint16(0);
% version_name = 'ver'; 
version_value = uint16(0);
% dataType_name = 'dType'; 
dataType_value = uint16(0);
% measuresType_name= 'mType'; 
measuresType_value = uint16(0);
% unitType_name = 'unit'; 
unitType_value = uint16(0);
% scale_name = 'scale'; 
scale_value = single(0);
% layout_name = 'layout'; 
layout_value = uint16(0);
% stepSize_name = 'stepSize'; 
stepSize_value = uint16(0);

% header = struct(magic_name, magic_value, version_name, version_value);

fileID = fopen('E:/work/ARDEONOVA/RUBEROID/dumps/02.02.2018_Baraban/base_10_800.bin');
magic_value = fread(fileID,1,'uint16')
version_value = fread(fileID,1,'uint16')
dataType_value = fread(fileID,1,'uint16')
measuresType_value = fread(fileID,1,'uint16')
unitType_value = fread(fileID,1,'uint16')
scale_value = fread(fileID,1,'double')
layout_value = fread(fileID,1,'uint16')
stepSize_value = fread(fileID,1,'uint16')

LEN = 8400
X = zeros(1600,LEN); X(:,:) = NaN;
Y = zeros(1600,LEN); Y(:,:) = NaN;
Z = zeros(1600,LEN); Z(:,:) = NaN;
for i = 1:LEN
    profile_size = fread(fileID,1,'uint32');

    x = zeros(1,profile_size); x(:) = NaN;
    y = zeros(1,profile_size); y(:) = NaN;
    tmp = zeros(1,profile_size*2);

    tmp = fread(fileID,2*profile_size,'int32', 'l');

    x = tmp(1:2:end)/scale_value;
    y = tmp(2:2:end)/scale_value;

    X(1:length(x), i) = x(1:end);
    Y(1:length(y), i) = y(1:end);
    Z(1:end,i) = i*0.025;
end
start = 1;
stop = LEN;

XX = X(:, start:stop);
YY = Y(:, start:stop);
ZZ = Z(:, start:stop);
% plot3(X,Y,Z);

% fseek(fileID, 24, 'bof');
% A = fread(fileID,'uint32', 'l');
% B = A(12:end);
% % C = reshape(A(begin:2:end),[1600, 2640]);
% figure;
% plot(B(2:2:3200));

% 
% % Write ascii STL from gridded data 
% [X,Y] = deal(1:40); % Create grid reference 
% Z = peaks(40); % Create grid height 
step = 100;
stlwrite('test.stl',XX(:,1:step:end),YY(:,1:step:end),ZZ(:,1:step:end),'mode','ascii', 'TRIANGULATION', 'f') ;