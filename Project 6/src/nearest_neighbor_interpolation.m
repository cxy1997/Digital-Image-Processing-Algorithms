function [ output ] = nearest_neighbor_interpolation( input, mat )
%NEAREST_NEIGHBOR_INTERPOLATION generates the transformed image based on
%   input image and transform matrix using nearest neighbor interpolation.
    [h, w] = size(input);
    output = zeros(h, w);
    for i = 1:h
        for j = 1:w
            inverse_pos = round([i-h/2 j-w/2 1] / mat + [h/2 w/2 0]);
            x = inverse_pos(1);
            y = inverse_pos(2);
            if x >= 1 && x <= h && y >= 1 && y <= w
                output(i, j) = input(x, y);
            end
        end
    end
end

