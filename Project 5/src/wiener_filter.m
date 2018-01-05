function [ output ] = wiener_filter( N, F, H)
% WIENER_FILTER generates a typical Wiener filter by definition
    H2 = abs(H) .^ 2;
    Sn = abs(fft2(center_transform(N))) .^ 2;
    Sf = abs(F) .^ 2;
    output = (H2 ./ H ./ (H2 + Sn ./ Sf));
end