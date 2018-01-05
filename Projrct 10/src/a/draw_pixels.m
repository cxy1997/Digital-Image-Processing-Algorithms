function [ output ] = draw_pixels( h, w, b_x, b_y )
%DRAW_PIXELS 
    output = zeros(h, w);
    for i = 1:size(b_x, 1)
        output(b_x(i), b_y(i)) = 1;
    end
end

