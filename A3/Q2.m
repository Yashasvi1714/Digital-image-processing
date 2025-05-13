clc;
close;

% Step 1: Read the images

im1 = imread('2.jpg');
im2 = imread('3.jpg');

% Step 2: Convert the images to grayscale

if size(im1, 3) == 3
    gray1 = rgb2gray(im1);
else
    gray1 = im1;
end

if size(im2, 3) == 3
    gray2 = rgb2gray(im2);
else
    gray2 = im2;
end

% Step 3: Print the image size

[im_h, im_w, im_s] = size(im1);
disp('Image1 Size:');
disp(['Image1 Height:   ',num2str(im_h)]);
disp(['Image1 Width:    ',num2str(im_w)]);
disp(['Image1 Scale:    ',num2str(im_s)]);

[im_h2, im_w2, im_s2] = size(im2);
disp('Image2 Size:');
disp(['Image2 Height:   ',num2str(im_h2)]);
disp(['Image2 Width:    ',num2str(im_w2)]);
disp(['Image2 Scale:    ',num2str(im_s2)]);

% Step 8: Repeat steps 4, 5, 6, 7 for at least 5 different sigma values

sigma = [1, 5, 10, 15, 20];


for i = 1:length(sigma)
    
    % Step 4: Low pass filter (spatial/frequency) image 1 with given sigma

    lpf1 = imgaussfilt(gray1, sigma(i));
    
    % Step 5: High pass filter (spatial/frequency) image 2 with given sigma
    
    hpf2 = gray2 - imgaussfilt(gray2, sigma(i));
    
    % Step 6: Create a hybrid image
    
    if size(lpf1) ~= size(hpf2)
     
        hpf2 = imresize(hpf2, size(lpf1));
    end

    hybrid_image = lpf1 + hpf2;

 
    
    % Step 7:Plot image1, image2, and output from step 6 side-by-side:


    figure;

    subplot(1,3,1);
    imshow(gray1);
    title(['GrayScale Image1 (Sigma = ' num2str(sigma(i)) ')']);
    
    subplot(1,3,2);
    imshow(gray2);
    title([' Gray Scale Image2 (Sigma = ' num2str(sigma(i)) ')']);
    
    subplot(1,3,3);
    imshow(hybrid_image,[]);
    title(['Hybrid (Sigma = ' num2str(sigma(i)) ')']);

end

% Step 9: Comment on the changes you see in your hybrid images from Step 8. 

% Low pass filter: Increasing sigma in a lpf1 for image1 leads tosmoothing and blurring of the image,
% reducing high-frequency details while preserving low-frequency components.

% High pass filter: Increasing sigma in a hpf2 for image2 reduces its ability to preserve and enhance high-frequency 
% details while potentially introducing a smoothing effect and capturing some mid-frequency information.

% Hybrid Image: Increasing sigma yields distinct visual changes.
% A higher sigma for the lpf1 on Image 1 results in stronger smoothing, reducing high-frequency details,
% making the hybrid image smoother, and emphasizing Image 1's coarse structure. 
% Conversely, elevating sigma for the hpf2 on Image 2 intensifies smoothing, 
% reducing high-frequency details and weakening the high-pass effect. 
% The hybrid image's look depends on the balance between LPF and HPF sigmas, 
% with similar values blending low and high frequencies, while larger sigma for LPF favors Image 1's appearance 
% and larger sigma for HPF favors Image 2, with reduced detail.


