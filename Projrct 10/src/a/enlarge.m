function [ X, Y ] = enlarge( x, y, H, W ,rate )
%ENLARGE 
    h = H / rate;
    w = W / rate;
    X = round((x - 1) * h) + 1;
    Y = round((y - 1) * w) + 1;
end

