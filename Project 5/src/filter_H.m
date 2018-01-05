function [ output ] = filter_H( M, N, a, b, T )
% FILTER_H generates a filter of size h * w
%   where H(u, v) = T / \pi(ua+vb) sin[\pi(ua+vb)] e^{-j\pi(ua+vb)}
    u = [1:M] - M / 2;
    v = [1:N] - N / 2;
    [V, U] = meshgrid(v, u);
    D = (V .* b + U .* a) .* pi;
    output = ones(M, N) .* T ./ D .* sin(D) .* exp(-j * D);
    output(D == 0) = 1;
end