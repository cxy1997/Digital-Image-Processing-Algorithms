clc; clear;
%% Read the original image
fig_original = cell(1,6);
figure('Name', 'Original images');
for i = 1:6
    subplot(2, 3, i);
    fig_original{1, i} = imread(sprintf('data/WashingtonDC_Band%d.tif', i));
    imshow(fig_original{1, i}, []);
    imwrite(fig_original{1, i}, sprintf('data/WashingtonDC_Band%d.png', i));
end

%% Principal components
figure('Name', 'Principal components');
[components, reconstruct] = PC(fig_original);
for i = 1:6
    subplot(2, 3, i);
    imshow(components{1, i}, []);
    imwrite(remap(components{1, i}), sprintf('data/components%d.png', i));
end

%% Reconstructed images
figure('Name', 'Reconstructed images');
for i = 1:6
    subplot(2, 3, i);
    imshow(reconstruct{1, i}, []);
    imwrite(remap(reconstruct{1, i}), sprintf('data/reconstruct%d.png', i));
end