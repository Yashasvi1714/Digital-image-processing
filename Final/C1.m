clc;
close;

% Read an RGB image
im = imread('1.jpg');


% 1. Contrast Enhancement (Histogram Equalization)
enhancedImage = histeq(im);



% Display the original and enhanced image side by side
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');
subplot(1, 2, 2);
imshow(enhancedImage);
title('Contrast Enhanced');

% 2. Filtering (Spatial Domain) - Gaussian Filter
%gaussianFiltered = imgaussfilt(enhancedImage, 2);
gaussianFiltered = imgaussfilt(enhancedImage, 4); 

% Display the original and filtered image side by side
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');
subplot(1, 2, 2);
imshow(gaussianFiltered);
title('Gaussian Filtered Image');

% 3. Image Pyramids with Different Levels
numLevels = 3; 
pyramidImage = gaussianFiltered;

% Display original image and pyramid images in one figure
figure;
subplot(2, numLevels + 1, 1);
imshow(im);
title('Original Image');

for level = 1:numLevels
    pyramidImage = impyramid(pyramidImage, 'reduce');
    subplot(2, numLevels + 1, level + 1);
    imshow(pyramidImage);
    title(['Pyramid Level ' num2str(level)]);
end

% 4. imresize
resizeFactor = 0.125;
resizedImage = imresize(im, resizeFactor);


% Display the original and resized image side by side
figure;
subplot(1, 2, 1);
imshow(im);
title('Original Image');
subplot(1, 2, 2);
imshow(resizedImage);
title('imresize');

% Display compression information for each method
fprintf('Original Image Size: %d bytes\n', numel(im));

% Contrast Enhancement Compression
fprintf('Contrast Enhancement Compression: %d bytes\n', numel(enhancedImage));

% Gaussian Filtering Compression
fprintf('Gaussian Filtering Compression: %d bytes\n', numel(gaussianFiltered));

% Image Pyramids Compression (for the last level)
fprintf('Image Pyramids Compression (Level %d): %d bytes\n', numLevels, numel(pyramidImage));

% imresize Compression
fprintf('imresize Compression: %d bytes\n', numel(resizedImage));

% Display compression ratios
fprintf('Contrast Enhancement Compression Ratio: %.2f\n', numel(im) / numel(enhancedImage));
fprintf('Gaussian Filtering Compression Ratio: %.2f\n', numel(im) / numel(gaussianFiltered));
fprintf('Image Pyramids Compression Ratio (Level %d): %.2f\n', numLevels, numel(im) / numel(pyramidImage));
fprintf('imresize Compression Ratio: %.2f\n', numel(im) / numel(resizedImage));
