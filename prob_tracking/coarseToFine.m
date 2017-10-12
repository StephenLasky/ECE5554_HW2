function [ output_args ] = coarseToFine(  )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

% level1 = im;
% level2 = gaussian_filter(level1,1);
% level2 = imresize(level2, 0.5);
% level3 = guassian_filter(level2,1);
% level3 = imresize(level3,0.5);

% tau = 0.00035;
tau = 0.0002;
ws = 15;





% track level 1
im{1} = im2single(imread('images/hotel.seq0.png'));
imo = im{1};
im{2} = im2single(imread('images/hotel.seq10.png'));
im{3} = im2single(imread('images/hotel.seq20.png'));
im{4} = im2single(imread('images/hotel.seq30.png'));
im{5} = im2single(imread('images/hotel.seq40.png'));
im{6} = im2single(imread('images/hotel.seq50.png'));

[keyXs, keyYs] = getKeypoints(im{1}, tau); % get initial keypoints

% track level 3
im3{1} = filterAndDownsample(im{1},2);
im3{2} = filterAndDownsample(im{2},2);
im3{3} = filterAndDownsample(im{3},2);
im3{4} = filterAndDownsample(im{4},2);
im3{5} = filterAndDownsample(im{5},2);
im3{6} = filterAndDownsample(im{6},2);



end

