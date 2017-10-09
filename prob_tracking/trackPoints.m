function [track_x, track_y] = trackPoints(pt_x, pt_y, im, ws)
% Tracking initial points (pt_x, pt_y) across the image sequence % track_x: [Number of keypoints] x [nim]
% track_y: [Number of keypoints] x [nim]
% Initialization
N = numel(pt_x);
nim = numel(im); track_x = zeros(N, nim); track_y = zeros(N, nim); track_x(:, 1) = pt_x(:); track_y(:, 1) = pt_y(:);
for t = 1:nim-1
    % Number of keypoints % Number of images
    % Tracking points from t to t+1
    [track_x(:, t+1), track_y(:, t+1)] = getNextPoints(track_x(:, t), track_y(:, t), im{t}, im{t+1}, ws);
end

[ track_x, track_y ] = validateTrackedPoints( track_x, track_y);

end
