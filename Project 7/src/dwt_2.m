function [ a, h, v, d ] = dwt_2( input, h_phi )
%DWT_2 calculates the discrete wavelet transform of given input and wavelet
    h_psi = h_phi_to_h_psi(h_phi);
	[height, width] = size(input);
    h0 = floor((height - 1) / 2) + fix(size(h_psi, 2) / 2);
    w0 = floor((width - 1) / 2) + fix(size(h_psi, 2) / 2);
    w1 = zeros(height, w0);
    for i = 1:height
        w1(i, :) = downsample(conv(input(i, :), fliplr(h_psi)) , 2, 1);
    end
    w2 = zeros(height, w0);
    for i = 1:height
        w2(i, :) = downsample(conv(input(i, :), fliplr(h_phi)), 2, 1);
    end
    d = zeros(h0, w0);
    for i = 1:w0
        d(:, i) = downsample(conv(w1(:, i)', fliplr(h_psi)), 2, 1);
    end
    v = zeros(h0, w0);
    for i = 1:w0
        v(:, i) = downsample(conv(w1(:, i)', fliplr(h_phi)), 2, 1);
    end
    h = zeros(h0, w0);
    for i = 1:w0
        h(:, i) = downsample(conv(w2(:, i)', fliplr(h_psi)), 2, 1);
    end
    a = zeros(h0, w0);
    for i = 1:w0
        a(:, i) = downsample(conv(w2(:, i)', fliplr(h_phi)), 2, 1);
    end
end

