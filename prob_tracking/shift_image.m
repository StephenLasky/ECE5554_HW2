function newim = shift_image( im, y, x)
% shifts an image by the specified x and y amount in pixels
% remainder of image is kept black

[rows,cols] = size(im);
newim = zeros(rows,cols,'single');

if x >= 0 && y >= 0
    newim(1+y:rows,1+x:cols) = im(1:rows-y,1:cols-x);
elseif x >= 0 && y < 0
    newim(1:rows+y,1+x:cols) = im(1-y:rows,1:cols-x);
elseif x < 0 && y >= 0
    newim(1+y:rows,1:cols+x) = im(1:rows-y,1-x:cols);
elseif x < 0 && y < 0
    newim(1:rows+y,1:cols+x) = im(1-y:rows,1-x:cols);

end

