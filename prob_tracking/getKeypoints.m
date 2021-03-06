function [keyXs, keyYs] = getKeypoints(im, tau)
% Detecting keypoints using Harris corner criterion  

% im: input image
% tau: threshold

% keyXs, keyYs: detected keypoints, with dimension [Number of keypoints] x [2]

im = KLT_tracker(im, tau);
% figure(); imshow(im);
num_keypoints = 0;
keyXs = zeros(1,0);
keyYs = zeros(1,0);

[rows,cols] = size(im);
for row = 1:rows
    for col = 1:cols
        if im(row,col) == 1     % if we see a white pixel
            num_keypoints = num_keypoints + 1;
            keyXs(1,num_keypoints) = col;
            keyYs(1,num_keypoints) = row;
        end
    end
end
  
end