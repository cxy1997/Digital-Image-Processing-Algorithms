function [ b_x, b_y, C, CD ] = outer_boundary( input, n )
%OUTER_BOUNDARY computes the longest outer boundary of given image
%   Gonzalez DIP 11.1
    [h, w] = size(input);
    b_x = zeros(2 * (h + w), 1);
    b_y = zeros(2 * (h + w), 1);
    C = zeros(2 * (h + w), 1);
    [x, y] = find(input > 0);
    pos = min(find(x + y == min(x + y)));
    b_x(1) = x(pos);
    b_y(1) = y(pos);
    c = 1;
    [b_x(2), b_y(2), c] = find_next_boundary(input, b_x(1), b_y(1), c, n);
    C(1) = mod(c, n) + 1;
    cnt = 2;
    while b_x(cnt) ~= b_x(1) || b_y(cnt) ~= b_y(1)
        [b_x(cnt + 1), b_y(cnt + 1), c] = find_next_boundary(input, b_x(cnt), b_y(cnt), c, n);
        C(cnt) = mod(c, n) + 1;
        cnt = cnt + 1;
    end
    C = C(1:cnt - 1);
    if n == 4
        C = 2 * mod(3 - C, 4);
    end
    C = smallest_integer(C);
    for i = 1:cnt-2
        CD(i) = mod(C(i + 1) - C(i), 8);
    end
    CD(cnt - 1) = mod(-sum(CD), 8);
    b_x = b_x(1:cnt);
    b_y = b_y(1:cnt);
end

