function out = detectKeypoints( im )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% create the window
w_size = 15;
w_rad = floor(w_size/2);
w = zeros(w_size,w_size,'single');
test_w = zeros(w_size,w_size,'single');
error_w = zeros(w_size,w_size,'single');

[im_h, im_w] = size(im);
error = zeros(im_h,im_w, 'single');


shifts = [1 0; 1 1; 0 1; -1 1; -1 0; -1 -1; 0 -1; 1 -1;]; % stored as (x,y)
shift_ct = 8;

border = w_rad+1                      % border + 1 so that we can shift the window
for x = 1+border:im_w-border          % add border so we don't go off the image for now
    for y = 1+border:im_h-border      % add border so we don't go off the image for now
        e = 0.0;
        error_w = 0 * error_w;
        test_w = im(y-w_rad:y+w_rad, x-w_rad:x+w_rad);
        
        
        for i=1:shift_ct
%             shift_x = shifts(i,1);
%             shift_y = shifts(i,2);     
            
            e = e + sum(sum((im(y-w_rad+shifts(i,2):y+w_rad+shifts(i,2), x-w_rad+shifts(i,1):x+w_rad+shifts(i,1)) - test_w) .^2));
        end
        
        e = e / shift_ct;
        error(y,x) = e;
    end
end

out = error; % delete later

imwrite(out, 'keypoints.jpg', 'quality', 100);

end


