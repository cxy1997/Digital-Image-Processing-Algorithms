function [ diff ] = difference( a, b )
%DIFFERENCE calculates the difference between two images
%   and generates a gray image \in [0, 1]
    diff = b - a;
    diff = (diff - min(min(diff))) ./ (max(max(diff)) - min(min(diff)));
end

