% profile on
im = im2single(imread('images/hotel.seq0.png'));
% im = im2single(imread('keypoints.jpg'));

% im = steveGradient(im);

% grad_x = compute_gradient(im, 1, 'x', 0, 1);
% grad_y = compute_gradient(im, 1, 'y', 0, 1);
% 
% figure(); imshow(grad_x+0.5);
% figure(); imshow(grad_y+0.5);

grad_45 = compute_gradient(im, 1, 'x', pi/4, 1);

figure(); imshow(grad_45+0.5);