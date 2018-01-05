function [ b1_x, b1_y, c1 ] = find_next_boundary( input, b0_x, b0_y, c, n )
%FIND_NEXT_BOUNDARY 
    if n == 8
        adj_x = [0 -1 -1 -1 0 1 1 1];
        adj_y = [-1 -1 0 1 1 1 0 -1];
    elseif n == 4
        adj_x = [0 -1 0 1];
        adj_y = [-1 0 1 0];
    end
    for i = c+size(adj_x, 2)-1:c+2*size(adj_x, 2)-2
        d = mod(i, size(adj_x, 2)) + 1;
        b1_x = b0_x + adj_x(d);
        b1_y = b0_y + adj_y(d);
        if (n == 8 || b1_x + adj_x(mod(c, n) + 1) ~= b0_x || b1_y + adj_y(mod(c, n) + 1) ~= b0_y) && input(b1_x, b1_y) > 0
            c1 = mod(d + size(adj_x, 2) - 2, size(adj_x, 2)) + 1;
            break;
        end
        if n == 4
            c1 = c;
            b1_x = b0_x + adj_x(mod(c, 4) + 1);
            b1_y = b0_y + adj_y(mod(c, 4) + 1);
        end
    end
end

