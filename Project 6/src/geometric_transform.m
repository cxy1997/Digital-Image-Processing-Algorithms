clc; clear;
%% Read the original image
fig_original = double(imread('data/ray_trace_bottle.tif')) / 255;
imwrite(fig_original, 'data/ray_trace_bottle.png');

%% The original image
figure('Name', 'Geometric Transform');
subplot(2, 4, 1);
imshow(fig_original, []);
title('Original image');

% Rotate
rotate_mat = rotate_matrix(45);
% Rotate using the nearest neighbor interpolation
subplot(2, 4, 2);
rotate_nn = nearest_neighbor_interpolation(fig_original, rotate_mat);
imshow(rotate_nn, []);
imwrite(rotate_nn, 'data/rotate_nn.png');
title('Rotate 45^{\circ} using the nearest neighbor');

% Rotate using bilinear interpolation
subplot(2, 4, 6);
rotate_bilinear = bilinear_interpolation(fig_original, rotate_mat);
imshow(rotate_bilinear, []);
imwrite(rotate_bilinear, 'data/rotate_bilinear.png');
title('Rotate 45^{\circ} using bilinear interpolation');

% Translate
translate_mat = translate_matrix(60, 80);
% Translate using the nearest neighbor interpolation
subplot(2, 4, 3);
translate_nn = nearest_neighbor_interpolation(fig_original, translate_mat);
imshow(translate_nn, []);
imwrite(translate_nn, 'data/translate_nn.png');
title('Translate (+60, +80) using the nearest neighbor');

% Translate using bilinear interpolation
subplot(2, 4, 7);
translate_bilinear = bilinear_interpolation(fig_original, translate_mat);
imshow(translate_bilinear, []);
imwrite(translate_bilinear, 'data/translate_bilinear.png');
title('Translate (+60, +80) using bilinear interpolation');

% Scale
scale_mat = scale_matrix(0.5, 2);
% Scale using the nearest neighbor interpolation
subplot(2, 4, 4);
scale_nn = nearest_neighbor_interpolation(fig_original, scale_mat);
imshow(scale_nn, []);
imwrite(scale_nn, 'data/scale_nn.png');
title('Scale (0.5, 2) using the nearest neighbor');

% Scale using bilinear interpolation
subplot(2, 4, 8);
scale_bilinear = bilinear_interpolation(fig_original, scale_mat);
imshow(scale_bilinear, []);
imwrite(scale_bilinear, 'data/scale_bilinear.png');
title('Scale (0.5, 2) using bilinear interpolation');



