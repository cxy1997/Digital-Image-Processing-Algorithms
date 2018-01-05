clc; clear;
%% Read the original image
fig_original = double(imread('data/book_cover.jpg')) / 255;
[Height, Width] =size(fig_original);
% Discrete Fourier Transformation
F = fft2(center_transform(fig_original));

%% Blurring Degradation and Restoration
figure('Name', 'Blurring Degradation');
% Display the original image
subplot(2, 3, 1);
imshow(fig_original, []);
title('The original image');

% Blur the image using paramaters a=b=0.1 and T = 1
subplot(2, 3, 2);
H = filter_H(Height, Width, 0.1, 0.1, 1);
blurred_image = center_transform(real(ifft2(H .* F)));
imshow(blurred_image, []);
imwrite(blurred_image, 'data/blurred_image.png');
title('Blurred image');

% Add Gaussian noise of 0 mean and variance of 650 to the blurred image
subplot(2, 3, 3);
noise = gaussian_noise(Height, Width, sqrt(650), 0) / 255;
blurred_noisy_image = blurred_image + noise;
imshow(blurred_noisy_image, []);
imwrite(blurred_noisy_image, 'data/blurred_noisy_image.png');
title('Add Gaussian noise');

% Restore the blurred image using the inverse filter
subplot(2, 3, 5);
F_blurred = fft2(center_transform(blurred_image));
blurred_restored = center_transform(real(ifft2(F_blurred ./ H)));
imshow(blurred_restored, []);
imwrite(blurred_restored, 'data/blurred_restored.png');
title('Blurred image restored with inverse filter');

% Restore the blurred noisy image using Wiener deconvolution filter
subplot(2, 3, 6);
F_blurred_noisy = fft2(center_transform(blurred_noisy_image));
blurred_noisy_restored = center_transform(real(ifft2(wiener_filter(noise, F, H) .* F_blurred_noisy)));
imshow(blurred_noisy_restored, []);
imwrite(blurred_noisy_restored, 'data/blurred_noisy_restored.png');
title('Blurred noisy image restored with Wiener deconvolution filter');


%% Investigate the performance of the Wiener deconvolution filter using Gaussian noise of 0 and different variances
figure('Name', 'Investigate Wiener deconvolution filter');

% Add Gaussian noise of 0 mean and variance of 0.1 to the blurred image
subplot(1, 3, 1);
noise = gaussian_noise(Height, Width, sqrt(0.1), 0) / 255;
F_blurred_noisy = fft2(center_transform(blurred_image + noise));
blurred_noisy_restored = center_transform(real(ifft2(wiener_filter(noise, F, H) .* F_blurred_noisy)));
imshow(blurred_noisy_restored, []);
imwrite(blurred_noisy_restored, 'data/gvar0_1.png');
title('Gaussian variance = 0.1');

% Add Gaussian noise of 0 mean and variance of 10 to the blurred image
subplot(1, 3, 2);
noise = gaussian_noise(Height, Width, sqrt(10), 0) / 255;
F_blurred_noisy = fft2(center_transform(blurred_image + noise));
blurred_noisy_restored = center_transform(real(ifft2(wiener_filter(noise, F, H) .* F_blurred_noisy)));
imshow(blurred_noisy_restored, []);
imwrite(blurred_noisy_restored, 'data/gvar10.png');
title('Gaussian variance = 10');

% Add Gaussian noise of 0 mean and variance of 1000 to the blurred image
subplot(1, 3, 3);
noise = gaussian_noise(Height, Width, sqrt(1000), 0) / 255;
F_blurred_noisy = fft2(center_transform(blurred_image + noise));
blurred_noisy_restored = center_transform(real(ifft2(wiener_filter(noise, F, H) .* F_blurred_noisy)));
imshow(blurred_noisy_restored, []);
imwrite(blurred_noisy_restored, 'data/gvar1000.png');
title('Gaussian variance = 1000');
