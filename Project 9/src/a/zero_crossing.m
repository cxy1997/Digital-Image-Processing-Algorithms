function [ output ] = zero_crossing( input, threshold )
%ZERO_CROSSING for Marr-Hildreth edge detector
    [h, w] = size(input);
    output = zeros(h, w);
    for i = 1:h
        for j = 1:w
            if i > 1 && i < h && input(i - 1, j) * input(i + 1, j) < 0 && abs(input(i - 1, j) - input(i + 1, j)) > threshold
                output(i, j) = 1;
            end
            if j > 1 && j < w && input(i, j - 1) * input(i, j + 1) < 0 && abs(input(i, j - 1) - input(i, j + 1)) > threshold
                output(i, j) = 1;
            end
            if i > 1 && i < h && j > 1 && j < w
                if input(i - 1, j - 1) * input(i + 1, j + 1) < 0 && abs(input(i - 1, j - 1) - input(i + 1, j + 1)) > threshold
                    output(i, j) = 1;
                end
                if input(i - 1, j + 1) * input(i + 1, j - 1) < 0 && abs(input(i - 1, j + 1) - input(i + 1, j - 1)) > threshold
                    output(i, j) = 1;
                end
            end
        end
    end
end

