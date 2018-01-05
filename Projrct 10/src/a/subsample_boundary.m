function [ mark ] = subsample_boundary( input, rate )
%SUBSAMPLE_BOUNDARY computes the subsampled boundary of given boundary
%   Gonzalez DIP 11.1
    [H, W] = size(input);
    h = H / rate;
    w = W / rate;
    rate = ceil(rate) + 1;
    mark = zeros(rate, rate);
    [X, Y] = find(input > 0);
    x = round(X / h) + 1;
    y = round(Y / w) + 1;
    for i = 1:size(X, 1)
        mark(x(i), y(i)) = 1;
    end
end

