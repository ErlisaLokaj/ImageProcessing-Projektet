pkg load image

% Read the binary image
image = imread('/Users/erlisalokaj/Desktop/Projekti 3 image processing /figura 2.png');
binaryImage = im2bw(image);  % Convert to binary image (black and white)

% Create a custom structuring element resembling a rounded rectangle
radius = 25;  % Set the desired radius for rounding the edges
se = strel('rectangle', [2*radius+1, 2*radius+1]);

% Get the neighborhood matrix of the structuring element
seMatrix = getnhood(se);

% Create a circular mask for rounding the edges
center = [radius+1, radius+1];
mask = createCircularMask(radius);

% Apply the circular mask to the neighborhood matrix
seMatrix = seMatrix .* mask;

% Update the structuring element with the modified neighborhood matrix
se.Neighborhood = seMatrix;

% Perform dilation
dilatedImage = imdilate(binaryImage, se);

% Display the original and dilated images
subplot(1, 2, 1);
imshow(binaryImage);
title('Original Image');

subplot(1, 2, 2);
imshow(dilatedImage);
title('Dilated Image');
