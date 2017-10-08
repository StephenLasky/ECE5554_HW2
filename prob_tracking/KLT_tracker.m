function im = KLT_tracker( im)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%%% test code: 
% im = create_checkerboard(128);
% im = imrotate(im,0);
% imo = im;
% im = KLT_tracker(im);
% figure(); imshow(cat(2,imo,im));
%%%

% 1. Compute the gradient at each point in the image.
grad_x = compute_gradient(im, 1, 'x', 0, 1);
grad_y = compute_gradient(im, 1, 'y', 0, 1);

% 2. Create the H matrix from the entries in the gradient 
[rows,cols] = size(im);
H = zeros(2,2,'single');
H_mtxs = zeros(2,2,rows,cols,'single');
w_size = 5;
w_rad = floor(w_size/2);

% compute Ix2, Iy2, Ixy
Ix2 = grad_x .^2;
Iy2 = grad_y .^2;
Ixy = grad_x .* grad_y;

% create filter for derivatives
% filter = create_gaussian_filter(w_size);
filter = 1; % keep filter at 1 for now
for row = 1+w_rad:rows-w_rad
    for col = 1+w_rad:cols-w_rad
%         H(1,1) = sum(sum((filter .* grad_x(row-w_rad:row+w_rad,col-w_rad:col+w_rad)) .^2));
%         H(1,2) = sum(sum((filter .* grad_x(row-w_rad:row+w_rad,col-w_rad:col+w_rad)) .* (filter .* grad_y(row-w_rad:row+w_rad,col-w_rad:col+w_rad))));
%         H(2,1) = H(1,2);
%         H(2,2) = sum(sum((filter .* grad_y(row-w_rad:row+w_rad,col-w_rad:col+w_rad)) .^2));
        H(1,1) = sum(sum(filter.*Ix2(row-w_rad:row+w_rad,col-w_rad:col+w_rad)));
        H(1,2) = sum(sum(filter.*Ixy(row-w_rad:row+w_rad,col-w_rad:col+w_rad)));
        H(2,1) = H(1,2);
        H(2,2) = sum(sum(filter.*Iy2(row-w_rad:row+w_rad,col-w_rad:col+w_rad)));
        
        H_mtxs(1:2,1:2,row,col) = H(1:2,1:2);
    end
end

% 3. Compute the eigenvalues
lambda_add = zeros(rows,cols,'single');
lambda_sub = zeros(rows,cols,'single');
temp = 0.0;

for row = 1+w_rad:rows-w_rad
    for col = 1+w_rad:cols-w_rad
        lambda_add(row,col) = H_mtxs(1,1,row,col) + H_mtxs(1,1,row,col);
        lambda_sub(row,col) = lambda_add(row,col);
        temp = 4*H_mtxs(1,2,row,col)*H_mtxs(2,1,row,col);
        temp = temp + (H_mtxs(1,1,row,col) - H_mtxs(2,2,row,col))^2;
        temp = sqrt(temp);
         
        lambda_add(row,col) = 0.5*(lambda_add(row,col) + temp);
        lambda_sub(row,col) = 0.5*(lambda_sub(row,col) - temp);
    end
end

% % 4. Find points with large responses (l_min > threshold)
% threshold = 0.0;
% im = zeros(rows,cols,'single');
% 
% for row=1:rows
%     for col=1:cols
%         if lambda_sub(row,col) > threshold
%             im(row,col) = lambda_sub(row,col);
%         end
%     end
% end


% 5. Choose those points where lmin is a local maximum as features
% for row = 1+w_rad:rows-w_rad
%     for col = 1+w_rad:cols-w_rad
%         window = im(row-w_rad:row+w_rad,col-w_rad:col+w_rad);
%         max_val = max(window(:));
%         window = max_val * floor(window / max_val);
%         im(row-w_rad:row+w_rad,col-w_rad:col+w_rad) = window;
%     end
% end

% TRY: 'R' method
% R = det(M) - k(trace(M))^2
% k = 0.04 - 0.06
% R = l1*l2 - k * (l1+l2)^2
k = 0.05;
R = lambda_sub .* lambda_add;
R = R - k * ((lambda_sub+lambda_add).^2);
im = R;





end

