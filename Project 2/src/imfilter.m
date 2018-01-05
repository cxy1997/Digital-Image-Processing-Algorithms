function [ g ] = imfilter( w, x )
%IMFILTER conducts the filter operation given filter w and matrix x
%   Paddings are automatically computered, with stepsize = 1.
    [h_x, w_x] = size(x);
    [h_w, w_w] = size(w);
    h_w_half = (h_w - 1) / 2;
    w_w_half = (w_w - 1) / 2;
    g = zeros(h_x, w_x);
    for i = 1 : h_x
        for j = 1 : w_x
            g(i, j) = 0;
            for k = -h_w_half : h_w_half
                for l = -w_w_half : w_w_half
                    if i + k > 0 && i + k <= h_x && j + l > 0 && j + l <= w_x
                        g(i, j) = g(i, j) + w(k + h_w_half + 1, l + w_w_half + 1) * x(i + k, j + l);
                    end
                end
            end
        end
    end
end

