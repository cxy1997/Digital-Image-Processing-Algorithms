clc; clear;
%% Read the original image
fig_original = remap_image(double(imread('data/building.tif')));
imwrite(fig_original, 'data/building.png');
figure('Name', 'Original image');
imshow(fig_original, []);

%% Roberts edge detector
figure('Name', 'Roberts edge detector');
gx = [-1 0;0 1];
gy = [0 -1;1 0];
subplot(1, 3, 1);
edge_x = remap_image(abs(filter2(gx, fig_original)));
imshow(edge_x, []);
imwrite(edge_x, 'data/roberts_x.png');
subplot(1, 3, 2);
edge_y = remap_image(abs(filter2(gy, fig_original)));
imshow(edge_y, []);
imwrite(edge_y, 'data/roberts_y.png');
subplot(1, 3, 3);
imshow(remap_image(edge_x + edge_y), []);
imwrite(remap_image(edge_x + edge_y), 'data/roberts_xy.png');

%% Prewitt edge detector
figure('Name', 'Prewitt edge detector');
gx = [-1 -1 -1;0 0 0;1 1 1];
gy = [-1 0 1;-1 0 1;-1 0 1];
subplot(1, 3, 1);
edge_x = remap_image(abs(filter2(gx, fig_original)));
imshow(edge_x, []);
imwrite(edge_x, 'data/prewitt_x.png');
subplot(1, 3, 2);
edge_y = remap_image(abs(filter2(gy, fig_original)));
imshow(edge_y, []);
imwrite(edge_y, 'data/prewitt_y.png');
subplot(1, 3, 3);
imshow(remap_image(edge_x + edge_y), []);
imwrite(remap_image(edge_x + edge_y), 'data/prewitt_xy.png');

%% Sobel edge detector
figure('Name', 'Prewitt edge detector');
gx = [-1 -2 -1;0 0 0;1 2 1];
gy = [-1 0 1;-2 0 2;-1 0 1];
subplot(1, 3, 1);
edge_x = remap_image(abs(filter2(gx, fig_original)));
imshow(edge_x, []);
imwrite(edge_x, 'data/sobel_x.png');
subplot(1, 3, 2);
edge_y = remap_image(abs(filter2(gy, fig_original)));
imshow(edge_y, []);
imwrite(edge_y, 'data/sobel_y.png');
subplot(1, 3, 3);
imshow(remap_image(edge_x + edge_y), []);
imwrite(remap_image(edge_x + edge_y), 'data/sobel_xy.png');

%% Marr-Hildreth edge detector
figure('Name', 'Marr-Hildreth edge detector');

subplot(2, 2, 1);
imshow(fig_original, []);
title('Original image');

subplot(2, 2, 2);
mh2 = marr_hildreth(fig_original, 25, 4);
imshow(uint8(mh2 * 255), []);
imwrite(mh2, 'data/mh2.png');
title('Step = 2, \sigma = 4 and n = 25');

subplot(2, 2, 3);
zc = zero_crossing(mh2, 0);
imshow(uint8(zc * 255), []);
imwrite(zc, 'data/zc.png');
title('Zero crossing using threshold of 0');

subplot(2, 2, 4);
zc2 = zero_crossing(mh2, max(max(mh2)) * 0.04);
imshow(uint8(zc2 * 255), []);
imwrite(zc2, 'data/zc2.png');
title('Zero crossing using threshold of 4% maximum value in (b)');

%% Canny edge detector
figure('Name', 'Canny edge detector');
ced = canny(fig_original, 25, 4, 3, 6);
imwrite(ced, 'data/canny.png');
imshow(uint8(ced * 255), []);




