% Using any programming language you feel comfortable with 
% (it is though recommended to use the provided free Matlab), 
% load an image and then perform a simple spatial 3x3 average of image pixels. 
% In other words, replace the value of every pixel by the average of the values in its 3x3 neighborhood. 
% If the pixel is located at (0,0), 
% this means averaging the values of the pixels at the positions 
% (-1,1), (0,1), (1,1), (-1,0), (0,0), (1,0), (-1,-1), (0,-1), and (1,-1). 
% Be careful with pixels at the image boundaries. Repeat the process 
% for a 10x10 neighborhood and again for a 20x20 neighborhood. 
% Observe what happens to the image 
% (we will discuss this in more details in the very near future, about week 3).

I = imread('lena.png');
windowWidth = 3;
kernel = ones(windowWidth) / windowWidth .^ 2;
I_blurred = imfilter(I, kernel, 'replicate');

figure();
imshow(I);
drawnow;

figure();
imshow(I_blurred);
drawnow;

windowWidth = 10;
kernel = ones(windowWidth) / windowWidth .^ 2;
I_blurred = imfilter(I, kernel, 'replicate');

figure();
imshow(I_blurred);
drawnow;

windowWidth = 20;
kernel = ones(windowWidth) / windowWidth .^ 2;
I_blurred = imfilter(I, kernel, 'replicate');

figure();
imshow(I_blurred);
drawnow;
