clc; clear;
%% Read the original image
fig29 = imread('data/Fig0929(a)(text_image).tif');
imwrite(fig29, 'data/fig29.png');
fig31 = imread('data/Fig0931(a)(text_image).tif');
imwrite(fig31, 'data/fig31.png');

%% Opening by reconstruction
figure('Name', 'Opening by reconstruction');
subplot(2, 2, 1);
imshow(fig29, []);

% Erode
subplot(2, 2, 2);
erode_29 = erode(fig29, ones(51, 1));
imshow(erode_29, []);
imwrite(erode_29, 'data/erode_29.png');

% Opening
subplot(2, 2, 3);
opening_29 = dilate(erode_29, ones(51, 1));
imshow(opening_29, []);
imwrite(opening_29, 'data/opening_29.png');

% Reconstruction
subplot(2, 2, 4);
reconstruct29 = geodesic_dilation(opening_29, fig29);
imshow(reconstruct29, []);
imwrite(reconstruct29, 'data/reconstruct29.png');

%% Filling holes
figure('Name', 'Filling holes');
subplot(2, 2, 1);
imshow(fig31, []);

% Complement
subplot(2, 2, 2);
IC = 1 - fig31;
imshow(IC, []);
imwrite(IC, 'data/IC.png');

% Marker image
subplot(2, 2, 3);
marker31 = zeros(size(fig31));
marker31(1, :) = 1 - fig31(1, :);
marker31(:, 1) = 1 - fig31(:, 1);
marker31(size(fig31, 1), :) = 1 - fig31(size(fig31, 1), :);
marker31(:, size(fig31, 2)) = 1 - fig31(:, size(fig31, 2));
imshow(marker31, []);
imwrite(marker31, 'data/marker31.png');

% Fill holes
subplot(2, 2, 4);
H = 1 - geodesic_dilation(marker31, IC);
hole = H & IC;
hole_filled = hole | fig31;
imshow(hole_filled, []);
imwrite(hole_filled, 'data/hole_filled.png');

%% Border clearing
figure('Name', 'Border clearing');
% Marker image
subplot(1, 2, 1);
marker29 = zeros(size(fig29));
marker29(1, :) = fig29(1, :);
marker29(:, 1) = fig29(:, 1);
marker29(size(fig29, 1), :) = fig29(size(fig29, 1), :);
marker29(:, size(fig29, 2)) = fig31(:, size(fig29, 2));
marker29 = geodesic_dilation(marker29, fig29);
imshow(marker29, []);
imwrite(marker29, 'data/marker29.png');

% no touch
subplot(1, 2, 2);
no_touch = fig29 - marker29;
imshow(no_touch, []);
imwrite(no_touch, 'data/no_touch.png');

