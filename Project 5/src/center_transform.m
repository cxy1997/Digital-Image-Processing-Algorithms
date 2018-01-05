function [ output ] = center_transform( input )
% CENTER_TRANSFORM centerize an image by applying
%   f(x, y) = f(x, y) * (-1)^{x+y}
    [h, w] = size(input);
    u = 1:h;
    v = 1:w;
    [V, U] = meshgrid(v, u);
    D = V + U;
    output = input .* power(-1, D);
end