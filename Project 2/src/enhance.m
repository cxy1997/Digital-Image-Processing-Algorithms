clc; clear;
%% Read the original image
% (a) The original image
fig_original = double(imread('data/skeleton_orig.tif')) / 255;
figure;
subplot(2, 4, 1);
imshow(fig_original);
imwrite(fig_original, 'data/skeleton_orig.png');

% (b) The Laplacian of the original image
laplace_result = imfilter([-1 -1 -1; -1 8 -1; -1 -1 -1], fig_original);
subplot(2, 4, 2);
imshow(remap(laplace_result, 0, 1));
imwrite(remap(laplace_result, 0, 1), 'data/laplace_result.png');

% (c) The sharpened image using Laplacian
sharpened_laplace_result = fig_original + laplace_result;
subplot(2, 4, 3);
imshow(sharpened_laplace_result);
imwrite(sharpened_laplace_result, 'data/sharpened_laplace_result.png');

% (d) The Sobel gradient of the original image
sobel_grad = abs(imfilter([-1 -2 -1; 0 0 0; 1 2 1], fig_original)) + abs(imfilter([-1 0 1; -2 0 2; -1 0 1], fig_original));
subplot(2, 4, 4);
imshow(sobel_grad);
imwrite(sobel_grad, 'data/sobel_grad.png');

% (e) The smoothed Sobel gradient
smoothed_sobel_grad = imfilter(ones(5)/25, sobel_grad);
subplot(2, 4, 5);
imshow(smoothed_sobel_grad);
imwrite(smoothed_sobel_grad, 'data/smoothed_sobel_grad.png');

% (f) Mask image formed by the product of (c) and (e)
product_laplace_sobel = sharpened_laplace_result .* smoothed_sobel_grad;
subplot(2, 4, 6);
imshow(product_laplace_sobel);
imwrite(product_laplace_sobel, 'data/product_laplace_sobel.png');

% (g) Sharpened image obtained by the sum of (a) and (f)
sharpened_image = max(fig_original + product_laplace_sobel, 0);
subplot(2, 4, 7);
imshow(sharpened_image);
imwrite(sharpened_image, 'data/sharpened_image.png');

% (h) Final result obtained by applying a powerlaw transformation to (g)
final_result = power(sharpened_image, 0.5);
subplot(2, 4, 8);
imshow(final_result);
imwrite(final_result, 'data/final_result.png');
