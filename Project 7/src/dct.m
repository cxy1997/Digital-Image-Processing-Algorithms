function [ output ] = dct( input, mask )
%DCT calculates the DCT transform given a 8*8 image & mask
	[h, w] = size(input);
    b_h = fix((h - 1) / 8) + 1;
    b_w = fix((w - 1) / 8) + 1;
    output = zeros(b_h * 8, b_w * 8);
    output(1:h, 1:w) = input;

    r = ones(8) ./ sqrt(8);
    r(2:8, 1:8) = r(2:8, 1:8) .* sqrt(2);
    r = r .* cos(pi * [0:7]' * [1:2:15] / 16);
    
    for i = 1:b_h
        for j = 1:b_w
            t = (r * output(i * 8 - 7:i * 8, j * 8 - 7:j * 8) * r') .* mask;
            output(i * 8 - 7:i * 8, j * 8 - 7:j * 8) = r' * t * r; 
        end
    end
end

