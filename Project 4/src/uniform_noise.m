function [ output ] = uniform_noise( M, N, a, b )
%UNIFORM_NOISE of size M * N
%   p(z) = 1 / (b - a), if a <= z <= b
%          0,           otherwise
    output = a + rand(M, N) * (b - a);
end

