pkg load image

lena = imread('/Users/erlisalokaj/Desktop/Projekti 3 image processing /lena.tiff');
lena = im2double(lena);

[M, N, ~] = size(lena);

u0 = 100;  % Choose the desired center coordinates u0, v0
v0 = 150;
Do = 50;   % Choose the desired value for Do

% Perform Fourier transform
fft_lena = fft2(lena);

% Create the filter
filter = create_filter(M, N, u0, v0, Do);

% Apply the filter to the Fourier transform of the image
fft_lena_filtered = fft_lena .* filter;

% Perform inverse Fourier transform to obtain the denoised image
denoised_lena = real(ifft2(fft_lena_filtered));

% Display the results
subplot(1, 3, 1);
imshow(lena);
title('Original Image');

subplot(1, 3, 2);
imshow(abs(fftshift(filter)));
title('Filter');

subplot(1, 3, 3);
imshow(denoised_lena);
title('Denoised Image');
