% For every 3 \times 33×3 block of the image (without overlapping), 
% replace all corresponding 9 pixels by their average. 
% This operation simulates reducing the image spatial resolution. 
% Repeat this for 5 \times 55×5 blocks and 7 \times 77×7 blocks. 
% If you are using Matlab, investigate simple command lines to do this important operation.

I = imread('lena.png');

figure();
imshow(I);

windowWidth = 3;
kernel = ones(windowWidth) / windowWidth .^ 2;
I_blurred = imfilter(I, kernel, 'replicate');

figure();
imshow(I_blurred);

windowWidth = 5;
kernel = ones(windowWidth) / windowWidth .^ 2;
I_blurred = imfilter(I, kernel, 'replicate');

figure();
imshow(I_blurred);

windowWidth = 7;
kernel = ones(windowWidth) / windowWidth .^ 2;
I_blurred = imfilter(I, kernel, 'replicate');

figure();
imshow(I_blurred);
