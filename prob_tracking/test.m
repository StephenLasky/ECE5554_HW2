% im = im2single(imread('images/hotel.seq0.png'));
% im = im2single(imread('checkboard.png'));





% %% test code: 
im = create_checkerboard(64);
im = imrotate(im,0);
imo = im;
im = KLT_tracker(im);
figure(); imshow(cat(2,imo,im+0.5));
% %%

% filter = create_gaussian_filter(5);
% figure(); imshow(filter+0.5);




