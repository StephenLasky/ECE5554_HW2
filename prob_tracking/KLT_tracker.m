function im = KLT_tracker( im)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% test code: 
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

% create filter for derivatives
% filter = create_gaussian_filter(w_size);
filter = 1; % keep filter at 1 for now
for row = 1+w_rad:rows-w_rad
    for col = 1+w_rad:cols-w_rad
        H(1,1) = sum(sum((filter .* grad_x(row-w_rad:row+w_rad,col-w_rad:col+w_rad)) .^2));
        H(1,2) = sum(sum((filter .* grad_x(row-w_rad:row+w_rad,col-w_rad:col+w_rad)) .* (filter .* grad_y(row-w_rad:row+w_rad,col-w_rad:col+w_rad))));
        H(2,1) = H(1,2);
        H(2,2) = sum(sum((filter .* grad_y(row-w_rad:row+w_rad,col-w_rad:col+w_rad)) .^2));
        
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

% 4. Find points with large responses (l_min > threshold)
threshold = 0.0;
im = zeros(rows,cols,'single');

for row=1:rows
    for col=1:cols
        if lambda_sub(row,col) > threshold
            im(row,col) = lambda_sub(row,col);
        end
    end
end



% % try exporting image as it is
% % im = abs(lambda_add) .* abs(lambda_sub);
% 
% % try creating lambda_min, lambda_max arrays
% lambda_min = lambda_sub;
% lambda_max = lambda_add;
% 
% for row=1:rows
%     for col=1:cols
%         if lambda_min(row,col) > lambda_max(row,col)
%             % swap
%             temp = lambda_min(row,col);
%             lambda_min(row,col) = lambda_max(row,col);
%             lambda_max(row,col) = temp;
%         end
%     end
% end
% 
% im = lambda_add;




end

