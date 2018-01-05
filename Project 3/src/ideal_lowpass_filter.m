function [ output ] = ideal_lowpass_filter( m, n, D0 )
%IDEAL_LOWPASS_FILTER The ideal lowpass filter
%   H(u, v) = 1, if D(u, v) <= D0
%             0, if D(u, v) > D0
    u = [0:(m-1) -m:-1];
    v = [0:(n-1) -n:-1];
    [V, U] = meshgrid(v, u);
    D = V.^2 + U.^2;
    output = zeros(size(D));
    output(D <= D0^2) = 1;
end

