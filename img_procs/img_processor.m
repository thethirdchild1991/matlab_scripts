files = dir('video_frames/*.bmp');

files_num = length(files)

for k = 1 : 1;
    A = imread(['video_frames/' files(k).name]);
    imshow(A);
    
    [h w] = size(A);
    for i = 1:h
        for j = 1:w
        end
    end
    
end

