function [ track_x, track_y ] = validateTrackedPoints( track_x, track_y)
% removes key points that have left the image boundaries

[nkps, nim] = size(track_x);

for kp = 1:nkps
    for imn = 1:nim
        x = track_x(kp,imn);
        y = track_y(kp,imn);
        
        if isnan(x) || isnan(y)
            track_x(kp,:) = [];
            track_y(kp,:) = [];
            kp = kp - 1;
            nkps = nkps - 1;
        end
    end
end




end

