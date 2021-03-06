function [ new_track_x, new_track_y ] = invalidateTrackedPoints( track_x, track_y)
% removes key points that have left the image boundaries
% obviously, having this n

[nkps, nim] = size(track_x);

to_keep = [];
nkeep = 0;

kp = 1;
for kp = 1:nkps
    for imn = 1:nim
        
        x = track_x(kp,imn);
        y = track_y(kp,imn);
        
        if isnan(x) || isnan(y)
            nkeep = nkeep + 1;
            to_keep(nkeep) = kp;
            break;
        end
    end
    
    kp = kp + 1;
end

new_track_x = [];
new_track_y = [];

for i = 1:nkeep
    new_track_x(i) = track_x(to_keep(i),:);
    new_track_y(i) = track_y(to_keep(i),:);
end



end

