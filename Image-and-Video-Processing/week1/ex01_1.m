% Write a computer program capable of reducing the number of 
% intensity levels in an image from 256 to 2, in integer powers of 2. 
% The desired number of intensity levels needs to be a variable input to your program.

filename = 'lena.png';
range = 16;

I = imread(filename);

I_gray = rgb2gray(I);
I_reduced = floor( I_gray / (256/range) ) * (256/range);

f1 = figure(1);
imshow(I_gray);
title("Original image");

f2 = figure(2);
imshow(I_reduced);
title("Reduced");