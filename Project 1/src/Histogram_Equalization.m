clc;clear;
%% Write a computer program for computing the histogram of an image.
fig1 = imread('data/Fig1.jpg');
fig2 = imread('data/Fig2.jpg');
figure('Name', 'Original Histogram');
set(gcf, 'position', [0 0 1024 512]);
subplot(1, 2, 1);
[L1 D1] = myImhist(fig1);
title('Fig 1');
subplot(1, 2, 2);
[L2 D2] = myImhist(fig2);
title('Fig 2');

%% Implement the histogram equalization technique.
figure('Name', 'Transformation of Fig. 1');
set(gcf, 'position', [0 0 960 512]);
subplot(1, 2, 1);
imshow(fig1, []);
R1 = myEqualization(L1, D1);
for i = 1:size(fig1, 1)
    for j = 1:size(fig1, 2)
        fig1(i, j) = R1(fig1(i, j) + 1);
    end
end
subplot(1, 2, 2);
imshow(fig1, []);

figure('Name', 'Transformation of Fig. 2');
set(gcf, 'position', [0 0 1024 512]);
subplot(1, 2, 1);
imshow(fig2, []);
R2 = myEqualization(L2, D2);
for i = 1:size(fig2, 1)
    for j = 1:size(fig2, 2)
        fig2(i, j) = R2(fig2(i, j) + 1);
    end
end
subplot(1, 2, 2);
imshow(fig2, []);

figure('Name', 'Transformation Function');
subplot(1, 2, 1);
plot(R1);
subplot(1, 2, 2);
plot(R2);

figure('Name', 'Equalized Histogram');
set(gcf, 'position', [0 0 1024 512]);
subplot(1, 2, 1);
[L1 D1] = myImhist(fig1);
%title('Fig 1');
subplot(1, 2, 2);
[L2 D2] = myImhist(fig2);
%title('Fig 2');