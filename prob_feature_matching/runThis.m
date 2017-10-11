function featureMatching
% Matching SIFT Features

im1 = imread('stop1.jpg');
im2 = imread('stop2.jpg');

load('SIFT_features.mat'); % Load pre-computed SIFT features
% Descriptor1, Descriptor2: SIFT features from image 1 and image 2
% Frame1, Frame2: position, scale, rotation of keypoints

% YOUR CODE HERE

[,N1] = size(Descriptor1); N1 = N1(2);
[,N2] = size(Descriptor2); N2 = N2(2);


nn = zeros(N1,4,'single');  % nearest neighbors. USE: c | nc | ci | nci

% compute the nearest neighbors
for i = 1:N1
    c = realmax('single');
    nc = realmax('single');
    
    ci = -1;
    nci = -1;
    
    for j=1:N1
        Dij = sqrt(sum(Descriptor1(:, i) - Descriptor2(:,j)).^2);
%         Dij =   sqrt(    sum(  (Descriptor1(:, i) - Descriptor2(:,j)).^2  )   );
        
        % if new closest
        if c > Dij
            nc = c; nci = ci;
            c = Dij; ci = j;
        % if new nextClosest
        elseif nc > Dij
            nc = Dij; nci = j;
        end
    end
    
    nn(i,:) = [c,nc,ci,nci];
end

% compute the ratios & matches
ratios = zeros(N1,1,'single');
matches = zeros(2,0);
mct = 0;    % match count
for i=1:N1
    ratios(i) = nn(i,1) / nn(i,2);
    
    if ratios(i) <= 0.8     % if we have a match
        mct = mct + 1;
        matches(:,mct) = [i; nn(i,3)];
    end
    
end









% matches: a 2 x N array of indices that indicates which keypoints from image
% 1 match which points in image 2






% Display the matched keypoints
figure(1), hold off, clf
plotmatches(im2double(im1),im2double(im2),Frame1,Frame2,matches);