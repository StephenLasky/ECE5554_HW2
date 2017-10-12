function im = unTrackedPointsToFlow( im, track_x, track_y )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% track_z: [Number of keypoints] x [nim]

[track_x, track_y] = invalidateTrackedPoints(track_x,track_y);

[rows,cols] = size(im);
[nkp,nim] = size(track_x);
im_overlay = zeros(rows,cols,'single');
green_overlay = zeros(rows,cols,'single');


for kp = 1:nkp
    for imn = 1:nim
        x = round(track_x(kp,imn));
        y = round(track_y(kp,imn));
        if ~isnan(x) && ~isnan(y)
            if imn ~= 1
                im_overlay(y,x) = 1;
            else
                green_overlay(y,x) = 1;
            end
        end 
    end
end

% combine to form a colored image
imc = zeros(rows,cols,3,'single');
imc(1:rows,1:cols,1) = im(1:rows,1:cols);
imc(1:rows,1:cols,2) = im(1:rows,1:cols);
imc(1:rows,1:cols,3) = im(1:rows,1:cols);

% imc(1:rows,1:cols,2) = imc(1:rows,1:cols,2) + im_overlay;   % add green values
imc(1:rows,1:cols,1) = imc(1:rows,1:cols,2) + im_overlay;   % add red values
imc(1:rows,1:cols,2) = imc(1:rows,1:cols,2) + green_overlay;   % add green values

im = imc;

end

