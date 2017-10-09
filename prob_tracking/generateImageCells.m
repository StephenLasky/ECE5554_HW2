function im = generateImageCells( nim )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

im = {};
imNameStart = 'images/hotel.seq';
imNameEnd = '.png';

for imn = 1:nim
    imName = strcat(imNameStart, int2str(imn-1), imNameEnd);
    im{imn} = im2single(imread(imName));
end


end

