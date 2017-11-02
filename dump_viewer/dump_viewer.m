clc;
clear;
close all;

fileID = fopen('D:\work\020-series\PRODUCTION\12009\12009(dumps)\dump_z(66mm)0.025mmGirix12009(600exp)');
% fseek(fileID, 29, 'bof');
A = fread(fileID,'uint16', 'l');
B = A(12:end);
% C = reshape(A(begin:2:end),[1600, 2640]);
figure;
plot(B(2:2:3200));