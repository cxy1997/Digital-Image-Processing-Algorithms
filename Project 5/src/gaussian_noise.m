function [ output ] = gaussian_noise( M, N, sigma, zbar )
%GAUSSIAN_NOISE of size M * N
%   p(z) = 1 / sqrt(2 * pi)sigma * e^(-(z - zbar)^2 / 2sigma^2)
    output = zbar + randn(M, N) * sigma;
end

