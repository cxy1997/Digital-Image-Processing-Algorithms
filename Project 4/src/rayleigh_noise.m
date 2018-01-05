function [ output ] = rayleigh_noise( M, N, a, b )
%RAYLEIGH_NOISE of size M * N
%   p(z) = 2 / b * (z - a) * e^(-(z - a)^2 / b), z >= a
%          0                                   , z < a
    output = a + sqrt((-b * log(1 - rand(M, N))));
end

