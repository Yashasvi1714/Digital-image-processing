clc;
close;
% Step 1: Read the image
im3 = imread('3.jpg');

% Step 2: Print the image size
[im_h, im_w, im_s] = size(im3);
disp(['Image Height: ',num2str(im_h)]);
disp(['Image Width: ',num2str(im_w)]);
disp(['Image Scale:',num2str(im_s)]);

% Step 3: Convert to grayscale if RGB
if size(im3, 3) == 3
    gray3 = rgb2gray(im3);
else
    gray3 = im3;
end

% Step 4: Add Gaussian noise
im_gaussian_noise = imnoise(gray3,'gaussian'); 

% Step 5: Add salt & pepper noise
im_salt_pepper = imnoise(gray3,'Salt & Pepper'); 

% Step 6: Display outputs from steps 4 and 5 side by side
figure;
subplot(1,2,1), imshow(im_gaussian_noise);
title('Image with Gaussian Noise');

subplot(1,2,2), imshow(im_salt_pepper);
title('Image with Salt & Pepper noise');

% Step 7: Apply median filtering of size [3 3] on outputs from 4 & 5
median_1 = medfilt2(im_gaussian_noise, [3, 3]);
median_2 = medfilt2(im_salt_pepper, [3, 3]);

% Step 8: Display median filtering outputs side-by-side
figure;
subplot(1, 2, 1);
imshow(median_1);
title('Median Filtered (Gaussian Noise)');

subplot(1, 2, 2);
imshow(median_2);
title('Median Filtered (Salt & Pepper Noise)');

% The median filter is better at removing salt and pepper noise compared to Gaussian noise. 
% It excels at eliminating extreme pixel values caused by salt and pepper noise while preserving image details.
% Gaussian noise is more uniformly distributed and less affected by the median filter.

