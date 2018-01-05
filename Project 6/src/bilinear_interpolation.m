function [ output ] = bilinear_interpolation( input, mat )
%BILINEAR_INTERPOLATION generates the transformed image based on
%   input image and transform matrix using bilinear interpolation.
    [h, w] = size(input);
    output = zeros(h, w);
    for i = 1:h
        for j = 1:w
            inverse_pos = round([i-h/2 j-w/2 1] / mat + [h/2 w/2 0]);
            x = inverse_pos(1);
            y = inverse_pos(2);
            if x >= 1 && x <= h && y >= 1 && y <= w
                x1 = x - floor(x);
                y1 = y - floor(y);
                output(i, j) = input(floor(x), floor(y)) * (1 - x1) * (1 - y1) + ...
                               input(floor(x), ceil(y)) * (1 - x1) * y1 + ...
                               input(ceil(x), floor(y)) * x1 * (1 - y1) + ...
                               input(ceil(x), ceil(y)) * x1 * y1;
            end
        end
    end
end

