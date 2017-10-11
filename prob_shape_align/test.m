im1 = im2single(imread('data/hammer_1.png'));
im2 = im2single(imread('data/hammer_2.png'));
% im1 = im2single(imread('data/butterfly_1.png'));
% im2 = im2single(imread('data/butterfly_2.png'));
% im2 = im2single(imread('data/turtle_1.png'));
% im1 = im2single(imread('data/turtle_2.png'));

align_shape(im1,im2);






% D = pdist2(X,Y)




disp('Program finished.');