function [ output_args ] = coarseToFine( im )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

level1 = im;
level2 = gaussian_filter(level1,1);
level2 = imresize(level2, 0.5);
level3 = guassian_filter(level2,1);
level3 = imresize(level3,0.5);





end

