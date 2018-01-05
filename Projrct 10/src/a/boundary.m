clc; clear;
%% Read the original image
fig_original = imread('data/noisy_stroke.tif');
imwrite(fig_original, 'data/noisy_stroke.png');
figure('Name', 'Bondary following');
rate = 57/5.1;
% Noisy image
subplot(2, 3, 1);
imshow(fig_original, []);
% Image smoothed with a 9*9 averaging mask 
subplot(2, 3, 2);
smoothed = imfilter(fig_original, fspecial('average',[9, 9]), 'corr');
imshow(smoothed, []);
imwrite(smoothed, 'data/smoothed.png');
% Smoothed image, thresholded using Otsu¡¯s method 
subplot(2, 3, 3);
otsued = otsu(smoothed);
imshow(otsued, []);
imwrite(otsued, 'data/otsued.png');
% Longest outer boundary of (c)
subplot(2, 3, 4);
[bx, by, C, CD] = outer_boundary(otsued, 8);
ob = draw_pixels(size(otsued, 1), size(otsued, 2), bx, by);
imshow(ob, []);
imwrite(ob, 'data/ob.png');
% Subsampled boundary
subplot(2, 3, 5);
mark = subsample_boundary(ob, rate);
subsampled = draw_subsample(mark, size(ob, 1), size(ob, 2), 1, rate);
imshow(subsampled, []);
imwrite(subsampled, 'data/subsampled.png');
% Connected points from (e)
subplot(2, 3, 6);
[bx, by, C, CD] = outer_boundary(mark, 4);
[x, y] = enlarge(bx, by, size(ob, 1), size(ob, 2), rate);
connect = draw_boundary(x, y, size(ob, 1), size(ob, 2));
imshow(connect, []);
imwrite(connect, 'data/connect.png');
display(C);
display(CD);
