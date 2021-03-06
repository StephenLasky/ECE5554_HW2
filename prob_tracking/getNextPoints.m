function [x2, y2] = getNextPoints(x, y, im1, im2, ws)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[rows, cols] = size(im1);
numiter = 5;        % number of times we run algorithm per keypoint for convergence

if size(x)-size(y) ~= 0 % check to ensure integrity of key point sizes
    disp('getNextPoints: WARNING: x,y sizes not equal.');
end

% 1. Compute gradients from Im1 (get Ix and Iy)
[Ix, Iy] = imgradientxy(im1);
It = im2 - im1;
Ix2 = Ix .^2;
Iy2 = Iy .^2;
Ixy = Ix .* Iy;
Ixt = Ix .* It;
Iyt = Iy .* It;

wr = floor(ws/2);   % window radius
A=0.0;B=0.0;C=0.0;D=0.0;E=0.0;u=0.0;v=0.0;  % matrix values, used to make solving u,v more simple

H = zeros(2,2,'single');
F = zeros(2,1,'single');
for i = 1:numiter
    for kp = 1:size(x)
        % grab various windows
        cx = x(kp);
        cy = y(kp);
        [Xq, Yq] = meshgrid(cx - wr: cx + wr, cy - wr:cy + wr);
    %     It_window = interp2(It, Xq, Yq);    % It % unused
    %     Ix_window = interp2(Ix, Xq, Yq);    % Ix % unused
    %     Iy_window = interp2(Iy, Xq, Yq);    % Iy % unused
        Ixy_window = interp2(Ixy, Xq, Yq);  % Ixy
        Ix2_window = interp2(Ix2, Xq, Yq);  % Ix2
        Iy2_window = interp2(Iy2, Xq, Yq);  % Iy2
        Ixt_window = interp2(Ixt, Xq, Yq);  % Ixt
        Iyt_window = interp2(Iyt, Xq, Yq);  % Iyt


        % compute second moment matrix
        H(1,1) = sum(sum(Ix2_window));
        H(1,2) = sum(sum(Ixy_window));
        H(2,1) = H(1,2);
        H(2,2) = sum(sum(Iy2_window));

        % compute the 'F' matrix
        F(1,1) = sum(sum(Ixt_window));
        F(2,1) = sum(sum(Iyt_window));

        % solve for u,v
        A = H(1,1);
        B = H(1,2);
        C = H(2,2);
        D = F(1,1);
        E = F(2,1);

        if A ~= 0   % most probable case
            v = (-E+D*B/A)/(C-B^2/A);
            u = -D/A-B/A*v;
        elseif A == 0 && B ~= 0
            v = -D/B;
            u = (-E-C*v)/B;
        elseif A==0 && B==0 && C~=0
            v = -E/C;
            u = 0;
        else    % strange, unusual case, just assume no change?
            v = 0;
            u = 0;
        end

        % update the keypoint
        x(kp) = x(kp) + u;
        y(kp) = y(kp) + v;

%         % make sure this keypoint has not fallen off of the image, and
%         % valid
%         if x(kp) > cols-wr || y(kp) > rows-wr || x(kp) < 1+wr || y(kp) < 1+wr || isnan(x(kp)) || isnan(y(kp))
%             x(kp) = []; y(kp) = [];
%             kp = kp - 1;
%         end

    end
end

% assign output values
x2 = x;
y2 = y;






end

