clc;
close;

% Step 1: Read the image
im2 = imread('2.jpg');

% Step 2: Print the image size
[im_h, im_w, im_s] = size(im2);
disp(['Image Height: ',num2str(im_h)]);
disp(['Image Width: ',num2str(im_w)]);
disp(['Image Scale:',num2str(im_s)]);

% Step 3: Convert to grayscale if RGB
if size(im2, 3) == 3
    gray2 = rgb2gray(im2);
else
    gray2 = im2;
end

% Step 4: Apply 3x3 box filter with padding 0 at edges
box_1 = imfilter(gray2, ones(3) / 9, 'conv', 0);

% Step 5: Apply 3x3 box filter with replicate padding
box_2 = imfilter(gray2, ones(3) / 9, 'replicate');

% Display box_1 in subplot 1
figure;
subplot(1, 2, 1);
imshow(box_1);
title('Box filter with padding 0 at edges');

% Display box_2 in subplot 2
subplot(1, 2, 2);
imshow(box_2);
title('Box filter with replicate padding');

% Step 6: Apply [-1 0 1; -1 0 1; -1 0 1] kernel
edge_1 = imfilter(gray2, [-1 0 1; -1 0 1; -1 0 1]);

% Step 7: Explain what the filter/kernel from step 6 does?
% Applies a filter known as the Sobel filter to the grayscale image. 
% It is commonly used for edge detection in images. 
% It calculates the gradient in both the horizontal and vertical directions. 
% Values: [-1 0 1; -1 0 1; -1 0 1];

% Step 8: Apply [-1 20 1; -1 20 1; -1 20 1] kernel
edge_2 = imfilter(gray2, [-1 20 1; -1 20 1; -1 20 1]);

% Step 9: Plot grayscale image, outputs from step 6 and 8 side-by-side
figure; 

subplot(1, 3, 1);
imshow(gray2);
title('Grayscale Image');

subplot(1, 3, 2);
imshow(edge_1);
title('Edge Filtered 1');

subplot(1, 3, 3);
imshow(edge_2);
title('Edge Filtered 2');
