clc; clear;
%% Read the original image
fig_original = double(imread('data/Circuit.tif')) / 255;
imwrite(fig_original, 'data/circuit.png');
[h, w] = size(fig_original);

%% Simulate different noises
figure('Name', 'Noises');
% Gaussian noise
subplot(2, 3, 1);
histogram(gaussian_noise(100, 100, 1, 0), 100);
title('Gaussian noise, z = 0, \sigma^2 = 1');
% Rayleigh noise
subplot(2, 3, 2);
histogram(rayleigh_noise(100, 100, 0, 1), 100);
title('Rayleigh noise, a = 0, b = 1');
% Erlang (gamma) noise
subplot(2, 3, 3);
histogram(gamma_noise(100, 100, 1, 2), 100);
title('Erlang noise, a = 1, b = 2');
% Exponential noise
subplot(2, 3, 4);
histogram(exponential_noise(100, 100, 1), 100);
title('Exponential noise, a = 1');
% Uniform noise
subplot(2, 3, 5);
histogram(uniform_noise(100, 100, 1, 10), 100);
title('Uniform noise, a = 0, b = 10');
% Impulse (salt-and-pepper) noise
subplot(2, 3, 6);
histogram(pepper_noise(100, 100, 0.1, 0.2), 100);
title('Impulse (salt-and-pepper) noise, a = 0.1, b = 0.2');

%% Display different noises
figure('Name', 'Noise effects');
subplot(2, 4, 1);
imshow(fig_original, []);
title('Original image');
% Gaussian noise
subplot(2, 4, 2);
guassian_image = fig_original + gaussian_noise(h, w, 20, 0) ./ 255;
imshow(guassian_image, []);
imwrite(guassian_image, 'data/guassian_image.png');
title('Gaussian noised image');
% Rayleigh noise
subplot(2, 4, 3);
rayleigh_image = fig_original + rayleigh_noise(h, w, 0, 80) ./ 255;
imshow(rayleigh_image, []);
imwrite(rayleigh_image, 'data/rayleigh_image.png');
title('Rayleigh noised image');
% Erlang (gamma) noise
subplot(2, 4, 4);
gamma_image = fig_original + gamma_noise(h, w, 1, 80) ./ 255;
imshow(gamma_image, []);
imwrite(gamma_image, 'data/gamma_image.png');
title('Erlang (gamma) noised image');
% Exponential noise
subplot(2, 4, 5);
exponential_image = fig_original + exponential_noise(h, w, 20) ./ 255;
imshow(exponential_image, []);
imwrite(exponential_image, 'data/exponential_image.png');
title('Exponential noised image');
% Uniform noise
subplot(2, 4, 6);
uniform_image = fig_original + uniform_noise(h, w, 50, 100) ./ 255;
imshow(uniform_image, []);
imwrite(uniform_image, 'data/uniform_image.png');
title('Uniform noised image');
% Impulse (salt-and-pepper) noise
subplot(2, 4, 7);
sp_noise = pepper_noise(h, w, 0.1, 0.2);
salt_pepper_image = fig_original;
salt_pepper_image(sp_noise == 0) = 0;
salt_pepper_image(sp_noise == 1) = 1;
imshow(salt_pepper_image, []);
imwrite(salt_pepper_image, 'data/salt_pepper_image.png');
title('Salt-and-pepper noised image');
% Salt noise
subplot(2, 4, 8);
sp_noise = pepper_noise(h, w, 0.1, 0.2);
salt_image = fig_original;
salt_image(sp_noise == 1) = 1;
pepper_image = fig_original;
pepper_image(sp_noise == 0) = 0;
imshow(salt_image, []);
imwrite(salt_image, 'data/salt_image.png');
title('Salt noised image');

%% Handle Gaussian noise
figure('Name', 'Handle Gaussian noise');
subplot(2, 2, 1);
imshow(fig_original, []);
title('Original image');
% Gaussian noise
subplot(2, 2, 2);
imshow(guassian_image, []);
title('Gaussian noised image');
% Arithmatic mean filter
subplot(2, 2, 3);
am_image = arithmatic_mean_filter(guassian_image, 3, 3);
imshow(am_image, []);
imwrite(am_image, 'data/am_image.png');
title('Arithmatic mean filtered image');
% Geometric mean filter
subplot(2, 2, 4);
gm_image = geometric_mean_filter(guassian_image, 3, 3);
imshow(gm_image, []);
imwrite(gm_image, 'data/gm_image.png');
title('Geometric mean filtered image');

%% Handle salt, pepper noise
figure('Name', 'Handle salt, pepper noise');
% Pepper noise
subplot(2, 2, 1);
imshow(pepper_image, []);
imwrite(pepper_image, 'data/pepper_image.png');
title('Image currupted by pepper noise');
% Salt noise
subplot(2, 2, 2);
imshow(salt_image, []);
title('Image currupted by salt noise');
% Contraharmonic filter of order 1.5
subplot(2, 2, 3);
cm_image = contraharmonic_mean_filter(pepper_image, 3, 3, 1.5);
imshow(cm_image, []);
imwrite(cm_image, 'data/cm_image_1.png');
title('Contraharmonic mean filtered image of order 1.5');
% Contraharmonic filter with Q = -1.5
subplot(2, 2, 4);
cm_image = contraharmonic_mean_filter(salt_image, 3, 3, -1.5);
imshow(cm_image, []);
imwrite(cm_image, 'data/cm_image_2.png');
title('Contraharmonic mean filtered image with Q = -1.5');

%% Handle salt & pepper noise
figure('Name', 'Handle salt & pepper noise');
% Salt & pepper noise
subplot(2, 2, 1);
imshow(salt_pepper_image, []);
title('Image currupted by salt-and-pepper noise');
% median filter
subplot(2, 2, 2);
median1 = median_filter(salt_pepper_image, 3, 3);
imshow(median1, []);
imwrite(median1, 'data/median1.png');
title('Apply 3*3 median filter');
% median filter
subplot(2, 2, 3);
median2 = median_filter(median1, 3, 3);
imshow(median2, []);
imwrite(median2, 'data/median2.png');
title('Apply 3*3 median filter');
% median filter
subplot(2, 2, 4);
median3 = median_filter(median2, 3, 3);
imshow(median3, []);
imwrite(median3, 'data/median3.png');
title('Apply 3*3 median filter');

%% Re-handle salt, pepper noise
figure('Name', 'Re-handle salt, pepper noise');
% Pepper noise
subplot(1, 2, 1);
max_image = max_filter(pepper_image, 3, 3);
imshow(max_image, []);
imwrite(max_image, 'data/max_image.png');
title('Pepper noise filtered with a max filter');
% Salt noise
subplot(1, 2, 2);
min_image = min_filter(salt_image, 3, 3);
imshow(min_image, []);
imwrite(min_image, 'data/min_image.png');
title('Salt noise filtered with a min filter');

%% Handle uniform + salt & pepper noise
% Uniform noise
subplot(3, 2, 1);
imshow(uniform_image, []);
title('Image corrupted by additive uniform noise');
% Add salt & pepper noise
subplot(3, 2, 2);
sp_noise = pepper_noise(h, w, 0.1, 0.2);
usp_image = uniform_image;
usp_image(sp_noise == 0) = 0;
usp_image(sp_noise == 1) = 1;
imshow(usp_image, []);
title('Image additionally corrupted by salt & pepper noise');
% Arithmatic mean filter
subplot(3, 2, 3);
am_image_2 = arithmatic_mean_filter(usp_image, 3, 3);
imshow(am_image_2, []);
imwrite(am_image_2, 'data/am_image_2.png');
title('Arithmatic mean filtered image');
% Geometric mean filter
subplot(3, 2, 4);
gm_image_2 = geometric_mean_filter(usp_image, 3, 3);
imshow(gm_image_2, []);
imwrite(gm_image_2, 'data/gm_image_2.png');
title('Geometric mean filtered image');
% Median mean filter
subplot(3, 2, 5);
median_m = median_filter(usp_image, 3, 3);
imshow(median_m, []);
imwrite(median_m, 'data/median_m.png');
title('Apply 3*3 median filter');
% Alpha-trimmed mean filter
subplot(3, 2, 6);
stmf_image = alpha_trimmed_mean_filter(usp_image, 3, 3, 5);
imshow(stmf_image, []);
imwrite(stmf_image, 'data/stmf_image.png');
title('Apply 3*3 alpha-trimmed mean filter');




