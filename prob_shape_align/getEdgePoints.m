function edgePoints = getEdgePoints(im)
% returns 2-dimensional vetctor :
% [ x1 y1 ]
% [ x2 y2 ]
% . . .
% [ xn yn ]

[rows,cols] = size(im);
edgePoints = zeros(2,1);

for row = 1:rows
    newEdgePoints = find(im(row,:) > 0);
    newEdgePoints(2,:) = row;
    edgePoints = cat(2,edgePoints,newEdgePoints);
end

edgePoints = edgePoints .';
edgePoints(1,:) = [];

end

