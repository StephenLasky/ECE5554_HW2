function out = thresholdKeypoints( im )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

% first, sort the image
% this will sort like so:
% 1 4 7
% 2 5 8
% 3 6 9
[rows, columns] = size(im);
im_sorted = reshape(sort(im(:), 'descend'), [rows, columns]);

% threshold at top 5%
% num_pixels = rows * columns;
% ith_pixel = 0.05 * num_pixels;
% threshold = im_sorted(rem( ,floor(ith_pixel/columns));

% threshold at 100th highest result %
threshold = im_sorted(1,2);

im = im .* (im>threshold);

out = im;

end

