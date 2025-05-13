clc;
close;

% Step 1: Read the image and create a Gaussian pyramid of 5 levels

im4 = imread('4.jpg');
pyramid = cell(1, 5);
pyramid{1} = im4; 

for i = 2:5
    pyramid{i} = impyramid(pyramid{i-1}, 'reduce');
end

% Step 2: Plot the input image and pyramid level images side-by-side

figure;

subplot(1, 6, 1);
imshow(im4);
title('Input Image');

for i = 1:5
    subplot(1, 6, i+1);
    imshow(pyramid{i});
    title(['Pyramid Level ' num2str(i)]);
end


% Step 3: Get the image size of the last pyramid level

[im_h2, im_w2, im_s2] = size(im4);
disp('Input Image Size:');
disp(['Input Image Height:   ',num2str(im_h2)]);
disp(['Input Image Width:    ',num2str(im_w2)]);
disp(['Input Image Scale:    ',num2str(im_s2)]);

[im_h, im_w, im_s] = size(pyramid{5});
disp('Image size of the last pyramid level:');
disp(['Last Pyramid Image Height:   ',num2str(im_h)]);
disp(['Last Pyramid Image Width:    ',num2str(im_w)]);
disp(['Last Pyramid Image Scale:    ',num2str(im_s)]);

% Step 4: Use 'imresize' to reduce the image size to the same as the last pyramid level

resizedImage = imresize(im4, [im_h, im_w]);

% Step 5: Plot input image, output from Step 4, and last pyramid level side-by-side

figure;

subplot(1, 3, 1);
imshow(im4);
title('Input Image');

subplot(1, 3, 2);
imshow(resizedImage);
title('Resized Image');

subplot(1, 3, 3);
imshow(pyramid{5});
title('Last Pyramid Level');

% Step 6: Comment on which method is best suited for downsampling 'impyramid/imresize'

% impyramid (Gaussian Pyramid):
% Advantages:Preserves low-frequency information while reducing image size.Creates a multi-level pyramid structure that allows to work at different scales of the image.
% Disadvantages:Limited control over the exact output size, as it follows a predefined downsampling factor (typically halving the size at each level).

% imresize:
% Advantages:Offers precise control over the output size, allowing you to specify the dimensions explicitly.Provides flexibility in choosing interpolation methods, which can be important for preserving image quality.
% Disadvantages:Does not inherently create a pyramid structure


% impyramid:To create a multi-level pyramid structure and preserve low-frequency information while downsampling
% imresize :More control over the output size, want to choose different interpolation methods, or do not need a multi-level pyramid structure,








