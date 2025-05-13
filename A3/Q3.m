% Step 1: Read the image and print the number of unique intensity values

im3 = imread('coins.png');
unique_values = unique(im3(:));
disp(['Number of unique intensity values in the image: ' num2str(length(unique_values))]);

% Step 2: Get number of objects in the image using 'bwlabel'

bw_image = im3 > 100;
l_im = bwlabel(bw_image);
num_objects = max(l_im(:));
disp(['Number of objects in the image: ' num2str(num_objects)])

% Step 3: Estimate region properties for each object

stats = regionprops(l_im, 'Area', 'Circularity', 'Orientation');

% Step 4: Find the object with minimum area and exclude all other objects

[min_area, min_area_idx] = min([stats.Area]);
im3_min_area = ismember(l_im, min_area_idx);

% Step 5: Plot input image and output from Step 4

figure;

subplot(1, 2, 1);
imshow(im3);
title('Input Image');

subplot(1, 2, 2);
imshow(im3_min_area);
title('Object with Minimum Area');

% Step 6: Find the object with maximum circularity and exclude all other objects

[max_circularity, max_circularity_idx] = max([stats.Circularity]);
im3_max_circularity = ismember(l_im, max_circularity_idx);

% Step 7: Plot input image and output from Step 6

figure;

subplot(1, 2, 1);
imshow(im3);
title('Input Image');

subplot(1, 2, 2);
imshow(im3_max_circularity);
title('Object with Maximum Circularity');

% Step 8: Find the object with maximum orientation and exclude all other objects

[max_orientation, max_orientation_idx] = max([stats.Orientation]);
im3_max_orientation = ismember(l_im, max_orientation_idx);

% Step 9: Plot input image and output from Step 8

figure;

subplot(1, 2, 1);
imshow(im3);
title('Input Image');

subplot(1, 2, 2);
imshow(im3_max_orientation);
title('Object with Maximum Orientation');

% 'bwlabel': binarizes the image based on a threshold of 100 and labels 
% to find the number of objects.Region properties like area, circularity, and orientation for each object.
