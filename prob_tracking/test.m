im = im2single(imread('images/hotel.seq0.png'));
% im2 = im2single(imread('images/hotel.seq1.png'));
% im = im2single(imread('checkboard.png'));

im = gaussian_filter(im,2);
im = imresize(im,0.5);
figure(); imshow(im);

% %% test code: 
% im = KLT_tracker(im, 0.0003);
% figure(); imshow(im);
% %%

% [rows,cols] = size(im);
% imc = zeros(rows,cols,3,'single');
% imc(1:rows,1:cols,1) = im;
% imc(1:rows,1:cols,2) = im;
% imc(1:rows,1:cols,3) = im;
% figure(); imshow(imc);

coarseToFine();


% PRIMARY TEST %
% tau = 0.00035;
% tau = 0.00035;
% ws = 15;
% im = generateImageCells(50);
% [keyXs, keyYs] = getKeypoints(im{1}, tau);
% [track_x, track_y] = trackPoints(keyXs, keyYs, im, ws);
% im = trackedPointsToFlow( im{1}, track_x, track_y );
% % im = unTrackedPointsToFlow(im{1},track_x,track_y);
% figure(); imshow(im);
disp('Program finished.');