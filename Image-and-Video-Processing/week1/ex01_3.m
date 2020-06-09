% Rotate the image by 45 and 90 degrees 
%(Matlab provides simple command lines for doing this).

I = imread('lena.png');

I_rotated = imrotate(I, 45);

figure();
imshow(I_rotated);

I_rotated = imrotate(I, 90);

figure();
imshow(I_rotated);