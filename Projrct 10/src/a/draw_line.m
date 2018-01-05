function [ output ] = draw_line( input, x1, y1, x2, y2 )
%DRAW_LINE draws a line on image
    output = input;
    if x1 == x2
        if y1 > y2
            y1 = y1 + y2;
            y2 = y1 - y2;
            y1 = y1 - y2;
        end
        for i = y1:y2
            output(x1, i) = 1;
        end
    elseif y1 == y2
        if x1 > x2
            x1 = x1 + x2;
            x2 = x1 - x2;
            x1 = x1 - x2;
        end
        for i = x1:x2
            output(i, y1) = 1;
        end
    end
end

