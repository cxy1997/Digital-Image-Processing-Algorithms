function [ output ] = threshold( input, threshold )
%THRESHOLD computes a binary image
%   output(i, j) = 1, input(i, j) > threshold
%                  0, input(i, j) <= threshold
    output = input;
    output(input <= threshold) = 0;
    output(input > threshold) = 1;
end

