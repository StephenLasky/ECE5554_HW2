function im = create_checkerboard( size )
% creates a single-precision checkerboard image of size: sizexsize
%   Detailed explanation goes here

% define board "dimensions?" as 8x8
dimension = 4;

im = zeros(size,size,'single');
square_size = size / dimension;
square_set = ones(square_size,square_size,'single');

col_start = 1;
for row = 1:square_size:size
    if col_start == 1
        col_start = 1 + square_size;
    else
        col_start = 1;
    end
    
    for col = col_start:2*square_size:size
        im(row:row+square_size-1,col:col+square_size-1) = square_set;
    end
end





end

