function im = opticalFlow( im, imct )
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here

ws = 3;

for i = 1:imct
    im{i} = filterAndDownsample(im{i},2)
end

% generate all possible keypoints
[rows,cols] = size(im{1});
keyXs = zeros(rows*cols,1,'single');
keyYs = zeros(rows*cols,1,'single');

num = 1;
for i = 1:rows
    for j = 1:cols
        keyYs(num) = i;
        keyXs(num) = j;
    end
end

% all possible keypoints generated, now feed into the KLT algorithm
[track_x, track_y] = trackPoints(keyXs, keyYs, im, ws);

% flow is a [H x W x 2] tensor. 
% flow(:,:,1) indicate the horizontal motion for all the pixels
% flow(:,:,2) indicate the vertical motion for all the pixels
flow = zeros(rows,cols,2,'single');



end

