clc;
clear;


A = imread('frame_0905_113809.bmp');
RES = zeros(800);
for i = 1:800
    val = 0.0;
    val_i = 0.0;
    for j = 1:600
        val = val + double(A(j,i));
        val_i = val_i + double(A(j,i)*j);
    end
    RES(i) = val_i/val;
end

plot(RES);
