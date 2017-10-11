im1 = im2single(imread('data/hammer_1.png'));
im2 = im2single(imread('data/hammer_2.png'));
% im1 = im2single(imread('data/butterfly_1.png'));
% im2 = im2single(imread('data/butterfly_2.png'));
% im2 = im2single(imread('data/turtle_1.png'));
% im1 = im2single(imread('data/turtle_2.png'));
% im1 = im2single(imread('data/chicken_1.png'));
% im2 = im2single(imread('data/chicken_2.png'));



align_shape(im1,im2);

% A = [ 1 2 3 -1 5 6 7 -1 9 0]
% B = find(A > 0)




% D = zeros(5,1,'single')
% p1 = 1
% 
% min_dist = min(D(p1,:))
% min_idxs = find(D(p1,:) == min_dist)
% x = min_idxs(1)


% x = realmax('single')




% D = pdist2(X,Y)




disp('Program finished.');