function [ output ] = gaussian_highpass_filter( m, n, D0 )
%GAUSSIAN_HIGHPASS_FILTER The Gaussian highpass filter
%   H(u, v) = 1 - e^(-D(u, v) / (2 * D0^2))
    u = [0:(m-1) -m:-1];
    v = [0:(n-1) -n:-1];
    [V, U] = meshgrid(v, u);
    D = V.^2 + U.^2;
    output = 1 - exp(-D./(2*(D0^2)));
end
