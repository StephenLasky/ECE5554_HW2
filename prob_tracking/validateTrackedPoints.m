function [ track_x, track_y ] = validateTrackedPoints( track_x, track_y)
% removes key points that have left the image boundaries
% obviously, having this n

[nkps, nim] = size(track_x);

kp = 1;
% for kp = 1:nkps
while kp <= nkps
    for imn = 1:nim
        
        x = track_x(kp,imn);
        y = track_y(kp,imn);
        
        if isnan(x) || isnan(y)
            track_x(kp,:) = [];
            track_y(kp,:) = [];
            nkps = nkps - 1;
            kp = kp - 1;
        end
    end
    
    kp = kp + 1;
end
end

