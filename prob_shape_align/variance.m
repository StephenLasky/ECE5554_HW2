function S = variance( x, y, cmx, cmy )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

[npts, ptd] = size(x);
dist_sum = 0.0;

% compute the average distance
for pt = 1:npts
    dist_sum = dist_sum + sqrt((x(pt)-cmx)^2+(y(pt)-cmy)^2);
end

avg_dist = dist_sum / npts;

var_sum = 0.0;

for pt = 1:npts
    var_sum = var_sum + (sqrt((x(pt)-cmx)^2+(y(pt)-cmy)^2)-avg_dist)^2;
end

S = 1/(npts-1) * var_sum;
S = sqrt(S);





end

