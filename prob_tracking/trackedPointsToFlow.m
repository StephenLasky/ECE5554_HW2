function im = trackedPointsToFlow( im, track_x, track_y )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% track_z: [Number of keypoints] x [nim]

[rows,cols] = size(im);
[nkp,nim] = size(track_x);
im_overlay = zeros(rows,cols,'single');

for kp = 1:nkp
    for imn = 1:nim
        x = round(track_x(kp,imn));
        y = round(track_y(kp,imn));
        im_overlay(y,x) = 1;
    end
end

% combine to form a colored image
imc = zeros(rows,cols,3,'single');
imc(1:rows,1:cols,1) = im(1:rows,1:cols);
imc(1:rows,1:cols,2) = im(1:rows,1:cols);
imc(1:rows,1:cols,3) = im(1:rows,1:cols);

imc(1:rows,1:cols,2) = imc(1:rows,1:cols,2) + im_overlay;   % add green values

im = imc;

end

