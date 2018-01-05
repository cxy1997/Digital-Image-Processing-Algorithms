function [ output ] = butterworth_lowpass_filter( m, n, D0, N )
%BUTTERWORTH_LOWPASS_FILTER The Butterworth lowpass filter
%   H(u, v) = 1 / (1 + (D(u, v) / D0)^2n)
    u = [0:(m-1) -m:-1];
    v = [0:(n-1) -n:-1];
    [V, U] = meshgrid(v, u);
    D = sqrt((V.^2 + U.^2));
    output = 1 ./ (1 + (D ./ D0).^(2 * N));
end

