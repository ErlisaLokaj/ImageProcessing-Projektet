pkg load image

lena = imread('/Users/erlisalokaj/Desktop/Projekti 3 image processing /lena.tiff');
lena = im2double(lena);
[x, y] = meshgrid(1:size(lena, 2), 1:size(lena, 1));
periodic_noise = 22 * cos((pi * x) / 3 + (pi * y) / 3) + 27 * sin((pi * x) / 2 + (pi * y) / 3);

% Normalize the periodic noise to match the intensity range of Lena
periodic_noise = (periodic_noise - min(periodic_noise(:))) / (max(periodic_noise(:)) - min(periodic_noise(:)));

noisy_lena = lena + periodic_noise;
fft_lena = fft2(noisy_lena);
threshold = 100;
fft_lena(abs(fft_lena) > threshold) = 0;
denoised_lena = ifft2(fft_lena);

subplot(1, 3, 1);
imshow(lena);
title('Original Image');

subplot(1, 3, 2);
imshow(noisy_lena);
title('Noisy Image');

subplot(1, 3, 3);
imshow(denoised_lena);
title('Denoised Image');
