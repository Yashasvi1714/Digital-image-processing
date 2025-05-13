clc;
close;
% Step 1: Read the image
im4 = imread('4.jpg');

% Step 2: Print the image size
[im_h, im_w, im_s] = size(im4);
disp(['Image Height: ',num2str(im_h)]);
disp(['Image Width: ',num2str(im_w)]);
disp(['Image Scale:',num2str(im_s)]);

% Step 3: Convert to grayscale if RGB
if size(im4, 3) == 3
    gray4 = rgb2gray(im4);
else
    gray4 = im4;
end

% Step 4: Apply Gaussian blur with different sigma values
g_blur1 = imgaussfilt(gray4, 1);
g_blur3 = imgaussfilt(gray4, 3);
g_blur6 = imgaussfilt(gray4, 6);
g_blur9 = imgaussfilt(gray4, 9);

% Step 5: Display the four outputs from step 4 side by side
figure;
subplot(1, 4, 1);
imshow(g_blur1);
title('Sigma = 1');

subplot(1, 4, 2);
imshow(g_blur3);
title('Sigma = 3');

subplot(1, 4, 3);
imshow(g_blur3);
title('Sigma = 3');

subplot(1, 4, 4);
imshow(g_blur9);
title('Sigma = 9');

% Step 6: Subtract grayscale image from each output generated in step 4
diff1 = gray4 - g_blur1;
diff3 = gray4 - g_blur3;
diff6 = gray4 - g_blur6;
diff9 = gray4 - g_blur9;

% Step 7: Display the four outputs from step 6 side-by-side
figure;
subplot(1, 4, 1);
imshow(diff1);
title('Difference (Sigma = 1)');

subplot(1, 4, 2);
imshow(diff3);
title('Difference (Sigma = 3)');

subplot(1, 4, 3);
imshow(diff6);
title('Difference (Sigma = 6)');

subplot(1, 4, 4);
imshow(diff9);
title('Difference (Sigma = 9)');

% Step 8:What is the name of digital image processing method you implemented in Step 6:

% Image Sharpening

% Image Sharpening works by accentuating the high-frequency components in an image, 
% which typically correspond to edges and fine details. 
% It involves subtracting a blurred version of the original image from the original image.
% The blurred version is created by applying a low-pass filter, such as a Gaussian filter, with a specific kernel size (sigma in this case). 
% When you subtract the blurred image from the original, 
% you are essentially amplifying the differences or edges in the image, which results in enhanced sharpness.


% Step 9: Can image sharpening operation be considered as a high pass filter? Explain in detail?

% Image sharpening can be considered a high-pass filtering operation 
% because it enhances edges and fine details by emphasizing high-frequency components 
% while suppressing low-frequency components,
% similar to how high-pass filters work in signal and image processing.




