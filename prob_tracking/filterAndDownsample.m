function im = filterAndDownsample( im, n )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here

for i = 1:n
    im = gaussian_filter(im, 1);
    im = imresize(im, 0.5);
end

