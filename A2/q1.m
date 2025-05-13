clc;
close;
% Step 1: Read the image
im = imread('1.jpg');

% Step 2: Print the image size
[im_h, im_w, im_s] = size(im);
disp(['Image Height: ',num2str(im_h)]);
disp(['Image Width: ',num2str(im_w)]);
disp(['Image Scale:',num2str(im_s)]);

% Step 3: Convert to grayscale if RGB
if size(im, 3) == 3
    gray = rgb2gray(im);
else
    gray = im;
end

% Step 4: Plot RGB and grayscale images side-by-side subplot
figure;
subplot(1, 2, 1);
imshow(im);
title('RGB Image');

subplot(1, 2, 2);
imshow(gray);
title('Grayscale Image');

% Step 5: Print min, max, and mean intensity
disp(['Min Intensity: ', num2str(min(im(:)))]);
disp(['Max Intensity: ', num2str(max(im(:)))]);
disp(['Mean Intensity: ', num2str(mean(im(:)))]);

% Step 6: Find image bit depth
info = imfinfo('1.jpg');
bit_depth = info.BitDepth;
disp(['Image Bit Depth: ', num2str(bit_depth)]);

% Step 7: Plot histogram
figure;
imhist(im);
title('Histogram of the Image');

% Step 8: Apply histogram equalization and CLAHE for gray image
heq = histeq(gray);
aheq = adapthisteq(gray);

% Step 9: Which output is better heq or aheq
figure;
subplot(3, 1, 1);
imshow(gray, []);
title('Original Grayscale Image');

subplot(3, 1, 2);
imshow(heq, []);
title('Histogram Equalization (HEQ)');

subplot(3, 1, 3);
imshow(aheq, []);
title('Contrast-Limited Adaptive Histogram Equalization (CLAHE)');
disp('CLAHE is better')
% Histogram equalization enhances the image's overall contrast
% Adaptive histogram equalization boosts the image's quality. 
% Adaptive Histogram Equalization, in my opinion, produces superior results.
% It illustrates, by looking at the results of histogram equalization,
% that it might have increased contrast but might have also brought in darkness in some areas.
% In contrast, Adaptive Histogram Equalization describes how it keeps the details, 
% enhances contrast, and prevents difficulties with darkening as shown in the




