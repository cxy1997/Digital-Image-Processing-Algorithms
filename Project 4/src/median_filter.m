function [ output ] = median_filter( input, h, w )
%MEDIAN_FILTER 
    [H, W] = size(input);
    T = zeros(H + h * 2 - 2, W + w * 2 - 2);
    T(h:(h+H-1), w:(w+W-1)) = input;
    output = input;
    for i = 1:H+h-1
        for j = 1:W+w-1
            t = T(i:(i+ h - 1), j:(j + w - 1));
            output(i, j) = median(t(:));
        end
    end
end

