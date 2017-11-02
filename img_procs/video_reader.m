v = VideoReader('AN with AN laser.mp4');
currAxes = axes;
i = 0;
while hasFrame(v)
    vidFrame = readFrame(v);    
    imwrite(vidFrame(85:970,550:1700,1),['video_frames/frame_' num2str(i) '.bmp']);
%     image(vidFrame, 'Parent', currAxes);
%     currAxes.Visible = 'off';
%     pause(0.25/v.FrameRate);
%     imshow(vidFrame);
    i = i+1;
end
'finish'

