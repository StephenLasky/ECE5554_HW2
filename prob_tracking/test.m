% profile on
% im = im2single(imread('images/hotel.seq0.png'));
% im = im2single(imread('checkboard.png'));




% im = create_checkerboard(256);
% 
% % grad_x = compute_gradient(im, 1, 'x', 0, 1);
% % grad_y = compute_gradient(im, 1, 'y', 0, 1);
% % grad = (grad_x.^2 + grad_y.^2).^(0.5);
% % c_im = cat(2,im,grad_x+0.5, grad_y+0.5, grad);
% 
% grad_45 = compute_gradient(im, 1, 'x', 0, 10);
% 
% figure(); imshow(grad_45+0.5);


% A = zeros(2,2,5,5)

im = create_checkerboard(64);
im = KLT_tracker(im);



% figure(); imshow(im);

