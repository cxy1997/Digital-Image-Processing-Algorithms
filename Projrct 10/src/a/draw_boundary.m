function [ output ] = draw_boundary( x, y, h, w )
%DRAW_BOUNDARY 
    output = zeros(h, w);
    for i = 2:size(x, 1)
        output = draw_line(output, x(i - 1), y(i - 1), x(i), y(i));
    end
end

