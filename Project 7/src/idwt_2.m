function [ output ] = idwt_2( a, h, v, d, h_phi, ext_h, ext_w )
%IDWT_2 calculates the inverse discrete wavelet transform of given input and wavelet
    h_psi = h_phi_to_h_psi(h_phi);
	[height, width] = size(a);
    h0 = 2 * height + size(h_psi, 2) - 1;
    w0 = 2 * width + size(h_psi, 2) - 1;
    H = 2 * height - size(h_psi, 2) + ext_h;
    W = 2 * width - size(h_psi, 2) + ext_w;
    output = zeros(h0, w0);
    
    kx = size(h_psi, 2) - 1;
    
    w1 = zeros(h0, width);
    for i = 1:width
        % upsample
        x = [d(:, i)'; zeros(size(d(:, i)'))];
        x = conv(x(:), h_psi);
        y = [v(:, i)'; zeros(size(v(:, i)'))];
        y = conv(y(:), h_phi);
        w1(:, i) = x + y;
    end
    
    w2 = zeros(h0, width);
    for i = 1:width
        x = [h(:, i)'; zeros(size(h(:, i)'))];
        x = conv(x(:), h_psi);
        y = [a(:, i)'; zeros(size(a(:, i)'))];
        y = conv(y(:), h_phi);
        w2(:, i) = x + y;
    end
    
    for i = 1:h0
        x = [w1(i, :); zeros(size(w1(i, :)))];
        x = conv(x(:), h_psi);
        y = [w2(i, :); zeros(size(w2(i, :)))];
        y = conv(y(:), h_phi);
        output(i, :) = x + y;
    end
    output = output(kx:H+kx-1, kx:W+kx-1);
end

