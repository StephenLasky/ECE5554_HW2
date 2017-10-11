im1 = im2single(imread('data/hammer_1.png'));
im2 = im2single(imread('data/hammer_2.png'));
% im1 = im2single(imread('data/butterfly_1.png'));
% im2 = im2single(imread('data/butterfly_2.png'));




% tmtx = [2 0 0; 0 2 0; 0 0 1]
% tform_translate = affine2d(tmtx);
% 
% figure(); imshow(im1);
% B = imwarp(im1,tform_translate);
% 
% figure(); imshow(B);

align_shape(im1,im2);





% D = pdist2(X,Y)




disp('Program finished.');