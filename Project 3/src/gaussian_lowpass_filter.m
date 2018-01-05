function [ output ] = gaussian_lowpass_filter( m, n, D0 )
%GAUSSIAN_LOWPASS_FILTER The Gaussian lowpass filter
%   H(u, v) = e^(-D(u, v) / (2 * D0^2))
    u = [0:(m-1) -m:-1];
    v = [0:(n-1) -n:-1];
    [V, U] = meshgrid(v, u);
    D = V.^2 + U.^2;
    output = exp(-D./(2*(D0^2)));
end
