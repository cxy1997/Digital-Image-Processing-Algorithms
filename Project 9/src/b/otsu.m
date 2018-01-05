function [ output ] = otsu( input )
%OTSU
% Gonzalez DIP 10.3.3
    [h, w] = size(input);
    n = h * w;
    mG = mean(mean(input))
    P = zeros(256, 1);
    m = zeros(256, 1);
    for i = 0:255
        P(i + 1) = length(find(input == i)) / n;
    end
    for i = 1:255
        m(i + 1) = m(i) + P(i + 1) * i;
        P(i + 1) = P(i + 1) + P(i);
    end
    sigmaB2 = ((mG * P - m) .^ 2) ./ P ./ (1 - P);
    T = mean(find(sigmaB2 == max(sigmaB2)));
    output = segment(input, T);
end

