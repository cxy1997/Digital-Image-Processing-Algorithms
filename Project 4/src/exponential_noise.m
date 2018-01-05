function [ output ] = exponential_noise( M, N, a )
%EXPONENTIAL_NOISE of size M * N
%   p(z) = ae^(-az), z >= 0
%          0,        z < 0
    output = -log(1 - rand(M, N)) / a;
end

