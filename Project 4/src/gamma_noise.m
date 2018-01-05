function [ output ] = gamma_noise( M, N, a, b )
%GAMMA_NOISE of size M * N
%   p(z) = a^b z^(b-1)/(b-1)!*e^(-az), z >= a
%          0,                          z < a
    output = zeros(M, N);
    for j = 1:b
        output = output - log(1 - rand(M, N)) / a;
    end
end

