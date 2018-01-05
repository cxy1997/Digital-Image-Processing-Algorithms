clc; clear;
%% Read the original image
fig_original = double(imread('data/characters_test_pattern.tif')) / 255;
imwrite(fig_original, 'data/characters_test_pattern.png');

%% Discrete Fourier Transformation
F = fft2(fig_original, size(fig_original, 1) * 2, size(fig_original, 2) * 2);

%% Ideal Lowpass Filter
% The original image
figure('Name', 'Ideal Lowpass Filter');
subplot(2, 3, 1);
imshow(fig_original, [])
title('original image');
% ILPF with cutoff frequency set at radii value 10
ideal_lowpass_10 = real(ifft2(ideal_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 10) .* F));
ideal_lowpass_10 = ideal_lowpass_10(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 2);
imshow(ideal_lowpass_10, [])
title('cutoff frequency: 10');
imwrite(ideal_lowpass_10, 'data/ILPF_10.png');
% ILPF with cutoff frequency set at radii value 30
ideal_lowpass_30 = real(ifft2(ideal_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 30) .* F));
ideal_lowpass_30 = ideal_lowpass_30(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 3);
imshow(ideal_lowpass_30, [])
title('cutoff frequency: 30');
imwrite(ideal_lowpass_30, 'data/ILPF_30.png');
% ILPF with cutoff frequency set at radii value 60
ideal_lowpass_60 = real(ifft2(ideal_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 60) .* F));
ideal_lowpass_60 = ideal_lowpass_60(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 4);
imshow(ideal_lowpass_60, [])
title('cutoff frequency: 60');
imwrite(ideal_lowpass_60, 'data/ILPF_60.png');
% ILPF with cutoff frequency set at radii value 160
ideal_lowpass_160 = real(ifft2(ideal_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 160) .* F));
ideal_lowpass_160 = ideal_lowpass_160(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 5);
imshow(ideal_lowpass_160, [])
title('cutoff frequency: 160');
imwrite(ideal_lowpass_160, 'data/ILPF_160.png');
% ILPF with cutoff frequency set at radii value 460
ideal_lowpass_460 = real(ifft2(ideal_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 460) .* F));
ideal_lowpass_460 = ideal_lowpass_460(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 6);
imshow(ideal_lowpass_460, [])
title('cutoff frequency: 460');
imwrite(ideal_lowpass_460, 'data/ILPF_460.png');

%% Butterworth Lowpass Filter
% The original image
figure('Name', 'Butterworth Lowpass Filter');
subplot(2, 3, 1);
imshow(fig_original, [])
title('original image');
% BLPF with cutoff frequency set at radii value 10
butterworth_lowpass_10 = real(ifft2(butterworth_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 10, 2) .* F));
butterworth_lowpass_10 = butterworth_lowpass_10(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 2);
imshow(butterworth_lowpass_10, [])
title('cutoff frequency: 10');
imwrite(butterworth_lowpass_10, 'data/BLPF_10.png');
% BLPF with cutoff frequency set at radii value 30
butterworth_lowpass_30 = real(ifft2(butterworth_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 30, 2) .* F));
butterworth_lowpass_30 = butterworth_lowpass_30(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 3);
imshow(butterworth_lowpass_30, [])
title('cutoff frequency: 30');
imwrite(butterworth_lowpass_30, 'data/BLPF_30.png');
% BLPF with cutoff frequency set at radii value 60
butterworth_lowpass_60 = real(ifft2(butterworth_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 60, 2) .* F));
butterworth_lowpass_60 = butterworth_lowpass_60(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 4);
imshow(butterworth_lowpass_60, [])
title('cutoff frequency: 60');
imwrite(butterworth_lowpass_60, 'data/BLPF_60.png');
% BLPF with cutoff frequency set at radii value 160
butterworth_lowpass_160 = real(ifft2(butterworth_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 160, 2) .* F));
butterworth_lowpass_160 = butterworth_lowpass_160(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 5);
imshow(butterworth_lowpass_160, [])
title('cutoff frequency: 160');
imwrite(butterworth_lowpass_160, 'data/BLPF_160.png');
% BLPF with cutoff frequency set at radii value 460
butterworth_lowpass_460 = real(ifft2(butterworth_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 460, 2) .* F));
butterworth_lowpass_460 = butterworth_lowpass_460(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 6);
imshow(butterworth_lowpass_460, [])
title('cutoff frequency: 460');
imwrite(butterworth_lowpass_460, 'data/BLPF_460.png');

%% Gaussian Lowpass Filter
% The original image
figure('Name', 'Gaussian Lowpass Filter');
subplot(2, 3, 1);
imshow(fig_original, [])
title('original image');
% GLPF with cutoff frequency set at radii value 10
gaussian_lowpass_10 = real(ifft2(gaussian_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 10) .* F));
gaussian_lowpass_10 = gaussian_lowpass_10(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 2);
imshow(gaussian_lowpass_10, [])
title('cutoff frequency: 10');
imwrite(gaussian_lowpass_10, 'data/GLPF_10.png');
% GLPF with cutoff frequency set at radii value 30
gaussian_lowpass_30 = real(ifft2(gaussian_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 30) .* F));
gaussian_lowpass_30 = gaussian_lowpass_30(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 3);
imshow(gaussian_lowpass_30, [])
title('cutoff frequency: 30');
imwrite(gaussian_lowpass_30, 'data/GLPF_30.png');
% GLPF with cutoff frequency set at radii value 60
gaussian_lowpass_60 = real(ifft2(gaussian_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 60) .* F));
gaussian_lowpass_60 = gaussian_lowpass_60(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 4);
imshow(gaussian_lowpass_60, [])
title('cutoff frequency: 60');
imwrite(gaussian_lowpass_60, 'data/GLPF_60.png');
% GLPF with cutoff frequency set at radii value 160
gaussian_lowpass_160 = real(ifft2(gaussian_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 160) .* F));
gaussian_lowpass_160 = gaussian_lowpass_160(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 5);
imshow(gaussian_lowpass_160, [])
title('cutoff frequency: 160');
imwrite(gaussian_lowpass_160, 'data/GLPF_160.png');
% GLPF with cutoff frequency set at radii value 460
gaussian_lowpass_460 = real(ifft2(gaussian_lowpass_filter(size(fig_original, 1), size(fig_original, 2), 460) .* F));
gaussian_lowpass_460 = gaussian_lowpass_460(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(2, 3, 6);
imshow(gaussian_lowpass_460, [])
title('cutoff frequency: 460');
imwrite(gaussian_lowpass_460, 'data/GLPF_460.png');

%% Ideal Highpass Filter
% IHPF with cutoff frequency set at radii value 30
ideal_highpass_30 = real(ifft2(ideal_highpass_filter(size(fig_original, 1), size(fig_original, 2), 30) .* F));
ideal_highpass_30 = ideal_highpass_30(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 1);
imshow(ideal_highpass_30, [])
title('cutoff frequency: 30');
imwrite(ideal_highpass_30, 'data/IHPF_30.png');
% IHPF with cutoff frequency set at radii value 60
ideal_highpass_60 = real(ifft2(ideal_highpass_filter(size(fig_original, 1), size(fig_original, 2), 60) .* F));
ideal_highpass_60 = ideal_highpass_60(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 2);
imshow(ideal_highpass_60, [])
title('cutoff frequency: 60');
imwrite(ideal_highpass_60, 'data/IHPF_60.png');
% IHPF with cutoff frequency set at radii value 160
ideal_highpass_160 = real(ifft2(ideal_highpass_filter(size(fig_original, 1), size(fig_original, 2), 160) .* F));
ideal_highpass_160 = ideal_highpass_160(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 3);
imshow(ideal_highpass_160, [])
title('cutoff frequency: 160');
imwrite(ideal_highpass_160, 'data/IHPF_160.png');

%% Butterworth Highpass Filter
% BHPF with cutoff frequency set at radii value 30
butterworth_highpass_30 = real(ifft2(butterworth_highpass_filter(size(fig_original, 1), size(fig_original, 2), 30, 2) .* F));
butterworth_highpass_30 = butterworth_highpass_30(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 1);
imshow(butterworth_highpass_30, [])
title('cutoff frequency: 30');
imwrite(butterworth_highpass_30, 'data/BHPF_30.png');
% BHPF with cutoff frequency set at radii value 60
butterworth_highpass_60 = real(ifft2(butterworth_highpass_filter(size(fig_original, 1), size(fig_original, 2), 60, 2) .* F));
butterworth_highpass_60 = butterworth_highpass_60(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 2);
imshow(butterworth_highpass_60, [])
title('cutoff frequency: 60');
imwrite(butterworth_highpass_60, 'data/BHPF_60.png');
% BHPF with cutoff frequency set at radii value 160
butterworth_highpass_160 = real(ifft2(butterworth_highpass_filter(size(fig_original, 1), size(fig_original, 2), 160, 2) .* F));
butterworth_highpass_160 = butterworth_highpass_160(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 3);
imshow(butterworth_highpass_160, [])
title('cutoff frequency: 160');
imwrite(butterworth_highpass_160, 'data/BHPF_160.png');

%% Gaussian Highpass Filter
% GHPF with cutoff frequency set at radii value 30
gaussian_highpass_30 = real(ifft2(gaussian_highpass_filter(size(fig_original, 1), size(fig_original, 2), 30) .* F));
gaussian_highpass_30 = gaussian_highpass_30(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 1);
imshow(gaussian_highpass_30, [])
title('cutoff frequency: 30');
imwrite(gaussian_highpass_30, 'data/GHPF_30.png');
% GHPF with cutoff frequency set at radii value 60
gaussian_highpass_60 = real(ifft2(gaussian_highpass_filter(size(fig_original, 1), size(fig_original, 2), 60) .* F));
gaussian_highpass_60 = gaussian_highpass_60(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 2);
imshow(gaussian_highpass_60, [])
title('cutoff frequency: 60');
imwrite(gaussian_highpass_60, 'data/GHPF_60.png');
% GHPF with cutoff frequency set at radii value 160
gaussian_highpass_160 = real(ifft2(gaussian_highpass_filter(size(fig_original, 1), size(fig_original, 2), 160) .* F));
gaussian_highpass_160 = gaussian_highpass_160(1:size(fig_original, 1), 1:size(fig_original, 2));
subplot(1, 3, 3);
imshow(gaussian_highpass_160, [])
title('cutoff frequency: 160');
imwrite(gaussian_highpass_160, 'data/GHPF_160.png');

