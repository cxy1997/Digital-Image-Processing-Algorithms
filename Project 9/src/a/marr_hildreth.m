function [ output ] = marr_hildreth( input, n, D0 )
%MARR_HILDRETH 
    u = (1-n)/2:(n-1)/2;
    v = (1-n)/2:(n-1)/2;
    [V, U] = meshgrid(v, u);
    D = V.^2 + U.^2;
    gaussian_filter = exp(-D./(2*(D0^2)));
    output = filter2(gaussian_filter, input);
    laplace_filter = [1 1 1; 1 -8 1; 1 1 1];
    output = filter2(laplace_filter, output);
end

