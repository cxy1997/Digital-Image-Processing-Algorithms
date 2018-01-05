function [ output ] = pepper_noise( M, N, a, b )
%PEPPER_NOISE of size M * N
%   p(z) = p_a,           z = a
%          p_b,           z = b
%          1 - p_a - p_b, otherwise
    output = ones(M, N) * 0.5;
    X = rand(M, N);
    output(X <= a) = 0;
    output(a <= X & X <= b) = 1;
end

