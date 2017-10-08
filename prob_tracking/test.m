% im = im2single(imread('images/hotel.seq0.png'));
% im = im2single(imread('checkboard.png'));





% test code: 
im = im2single(imread('images/hotel.seq0.png'));
% im = imrotate(im,0);
imo = im;
im = KLT_tracker(im);
figure(); imshow(cat(2,imo,im+0.5));
%%

