clear;
clc;
close all;

fileID = fopen('D:\work\020-series\PRODUCTION\12009\z_table.calibr');
fseek(fileID, 29, 'bof');
A = fread(fileID,'uint16', 'l');
% B = A(1:end);
% for i = 1 : 1600*1200*32
%     B(i) = A(29+2*i)*255 + A(29+2*i+1);
% end

C = reshape(A,[1600, 1200*32]);
C = C/32;
C = C';
% for i = 1200*32 : -32 : 1    
%     plot(C(:, i));
%     pause(0.1);
% end
X = 1:100:1600;
Y = 100*32:1*32:112*32;
Z = C(Y,X);
% 
% figure;
 surf(X, Y/32, Z);

xlabel('matrix width');
ylabel('matrix height');
zlabel('calib value');
% 'done'
