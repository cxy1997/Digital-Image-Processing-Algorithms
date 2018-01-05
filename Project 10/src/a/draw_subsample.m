function [ output ] = draw_subsample( mark, H, W, radius, rate )
%DRAW_SUBSAMPLE 
    output = zeros(H, W);
    [x, y] = find(mark > 0);
    [X, Y] = enlarge(x, y, H, W ,rate);
    for i = 1:size(x, 1)
        for j = -radius:radius
            for k = -radius:radius
                output(X(i) + j, Y(i) + k) = 1;
            end
        end
    end
end

