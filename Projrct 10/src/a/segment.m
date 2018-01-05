function [ output ] = segment( input, k )
%SEGMENT 
%   output(x, y) = 0, input(x, y) <= k
%                  1, input(x, y) > k
    output = zeros(size(input));
    output(input > k) = 1;
end

