function im = steveGradient( im )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

% for x
filter = [-1 0 1];
f_rad = 1;

new_im_x = im;
new_im_y = im;

[rows, cols] = size(im);

for y = 1:rows
    for x = 1+f_rad:cols-f_rad
        new_im_x(y,x) = sum(filter .* im(y,x-f_rad:x+f_rad));
    end
end

% for y
filter = [1; 0; -1];

for y = 1+f_rad:rows-f_rad
    for x = 1:cols
        new_im_y(y,x) = sum(filter .* im(y-f_rad:y+f_rad,x));        
    end
end

im = ((new_im_x .^2) + (new_im_y .^2)) .^(0.5);

end

