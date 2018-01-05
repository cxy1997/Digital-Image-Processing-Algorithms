clc; clear;
%% Read the original image
fig_original = imread('data/polymersomes.tif');
imwrite(fig_original, 'data/polymersomes.png');
figure('Name', 'Image segmentation');

% Original image
subplot(2, 2, 1);
imshow(fig_original, []);
title('Original image');

% Histogram
subplot(2, 2, 2);
imhist(fig_original);
title('Histogram');

% Basic global thresholding
subplot(2, 2, 3);
bgt = basic_global_thresholding(fig_original, 0);
imshow(bgt, []);
imwrite(bgt, 'data/bgt.png');
title('Basic global thresholding');

% Otsu's method
subplot(2, 2, 4);
om = otsu(fig_original);
imshow(om, []);
imwrite(om, 'data/om.png');
title('Otsu ''s method');