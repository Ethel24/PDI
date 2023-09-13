%%PRACTICA 1 EJERCICIO 3
%%Authors: Eliot Valdés, Ethel Padilla

clc
warning off all

% read the image peppers.png and store in a variable image
image = imread('peppers.png');

% get the total number of columns
[rows, columns, numberOfColorChannels] = size(image);

% turn off the color compoenets to show only the red
image(1:rows/3,:,2)=0;
image(1:rows/3,:,3)=0;

% turn off the color compoenets to show only the green
image(rows/3+1:2*rows/3,:,1)=0;
image(rows/3+1:2*rows/3,:,3)=0;

% turn off the color compoenets to show only the blue
image(2*rows/3+1:rows,:,1)=0;
image(2*rows/3+1:rows,:,2)=0;

% show de image
imshow(image)
