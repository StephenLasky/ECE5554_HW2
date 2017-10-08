function filter = create_gaussian_filter( f_width )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

% construct the filter 
filter = ones(f_width,f_width,'single');
[rows,cols] = size(filter);
f_rad = floor(f_width / 2);
sigma = f_rad / 3.0;
for row = 1:rows
    for col = 1:cols
        y = (f_rad+1) - row;
        x = col - (f_rad+1);
        G = exp(-(x^2+y^2)/(2*sigma^2));
        filter(row,col) = G;
    end
end
filter = 1/(2*pi*sigma^2) * filter;
f_sum = sum(sum(filter));        % should be equal to 1
filter = (1/f_sum) * filter ;    % use this to correct the filter so that it sums to one

end

