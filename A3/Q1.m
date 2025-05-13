clc;
close;

% Step 1: Read the image

im = imread('1.jpg');

% Step 2: Print the image size

[im_h, im_w, im_s] = size(im);
disp(['Image Height: ',num2str(im_h)]);
disp(['Image Width: ',num2str(im_w)]);
disp(['Image Scale:',num2str(im_s)]);

% Step 3: Convert to grayscale

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

% Step 5: Estimate the magnitude of Fourier Transform image

fft_im1 = fft2(gray);
f1=abs(fft_im1);
f2=log(abs(fft_im1));
f3=log(abs(fftshift(fft_im1)));

figure;

subplot(1, 3, 1);
imshow(f1, []);
title('Magnitude of FFT');

subplot(1, 3, 2);
imshow(f2, []);
title('Log Magnitude of FFT');

subplot(1, 3, 3);
imshow(f3, []);
title('Log Magnitude of FFT (Shifted)');

% Step 6: Plot the grayscale image, output from step 5, side-by-side. 

figure;

subplot(1, 2, 1);
imshow(gray);
title('Grayscale Image');

subplot(1, 2, 2);
imshow(log(abs(fft_im1)),[]);
title('Magnitude of Fourier Transform');

% Step 7:

% The Fourier transform is used for frequency analysis
% which provides information about the dominant frequencies present in an image. 
% Edges in an image are primarily associated with changes in intensity or color,
% which correspond to high-frequency components in the Fourier domain.
% When you take the Fourier transform of an image, 
% the high-frequency components tend to be concentrated in certain regions of the frequency domain.
% After transforming the image, 
% you can apply frequency domain filters to enhance or isolate specific frequency components. 
% Techniques like high-pass filtering can emphasize edges by amplifying high-frequency information.
% you can inverse transform it to get back to the spatial domain, where you can visualize the enhanced edges.


% Step 8: Apply inverse Fourier transform 

inv_fft_im1=ifft2(fft_im1);

% Step 9: Plot grayscale image, output from Step 5, and output from Step 8 side-by-side

figure;

subplot(1, 3, 1);
imshow(gray);
title('GrayScale Image');

subplot(1, 3, 2);
imshow(log(abs(fft_im1)),[]);
title('Magnitude of Fourier Transform');

subplot(1, 3, 3);
imshow(inv_fft_im1, []);
title('Inverse Fourier Transform Image');



