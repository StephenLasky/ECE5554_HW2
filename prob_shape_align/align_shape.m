function T = align_shape(im1, im2)

% im1: input edge image 1
% im2: input edge image 2

% Output: transformation T [3] x [3]

% 1. Find edge points in im1 and im2. Hint: use ?find?
[y1, x1] = find(im1 > 0);
[y2, x2] = find(im2 > 0);

% 2. Compute initial transformation (e.g., compute translation and scaling 
%    by center of mass, variance within each image)
% compute mean
cmX1 = mean(x1);    cmY1 = mean(y1);
cmX2 = mean(x2);    cmY2 = mean(y2);
dX = cmX2 - cmX1;
dY = cmY2 - cmY1;

% compute variances
S1 = variance(x1,y1,cmX1,cmY1);
S2 = variance(x2,y2,cmX2,cmY2);

% given translation matrix
%     [ a b c ]
% T = [ d e f ]
%     [ 0 0 1 ]

% initial matrix
T = [1 0 cmX2; 0 1 cmY2; 0 0 1] * [S2/S1 0 0; 0 S2/S1 0; 0 0 1] * [ 1 0 -cmX1; 0 1 -cmY1; 0 0 1]
% T = [1 0 0; 0 1 0; cmX2 0 cmY2] * [S2/S1 0 0; 0 S2/S1 0; 0 0 1] * [ 1 0 0; 0 1 0; -cmX1 -cmY1 1]
% T = [1 0 0; 0 1 0; 0 0 1];

% each row is p1 compared to a p2
D = pdist2([x1,y1],[x2,y2]);
[np1, np2] = size(D);

% c = T(1,3);
% f = T(2,3);

c = 0;
f = 0;

q_sum = 0.0;

for p1 = 1:np1
    % first, find the minimum value
    min_dist = min(D(p1,:));
    min_idxs = find(D(p1,:) == min_dist);
    p2 = min_idxs(1);
    
    % then, compute q such that
    % xPrime = xcosq + ysinq + c
    % yPrime = -xsinq + ycosq + f
    % where, c, f are already computed (constants)
    % (from complex formula we know that q is)
    x = x1(p1);
    y = y1(p1);
    xPrime = x2(p2);
    yPrime = y2(p2);
    q = asin((y/x+x/y)^(-1) * (-c/x+xPrime/x+f/y-yPrime/y));
    q_sum = q_sum + q;
end

q_sum
q_avg = q_sum / np1


% compute closest pairs







