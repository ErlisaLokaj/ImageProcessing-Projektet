pkg load image

% Read the binary image
image = imread('/Users/erlisalokaj/Desktop/Projekti 3 image processing /figura 2.png');
binaryImage = im2bw(image);  % Convert to binary image (black and white)

% Define the structuring element
se = strel('square', 50);  % Square structuring element of size 3x3

% Perform dilation
dilatedImage = imdilate(binaryImage, se);

% Display the original and dilated images
subplot(1, 2, 1);
imshow(binaryImage);
title('Original Image');

subplot(1, 2, 2);
imshow(dilatedImage);
title('Dilated Image');
