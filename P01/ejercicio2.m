%%PRACTICA 1 EJERCICIO 2
%%Authors: Eliot Valdés, Ethel Padilla

clc
warning off all

% read the image peppers.png and store in a variable image
image = imread('peppers.png');

% get the total number of columns
[rows, columns, numberOfColorChannels] = size(image);

% turn off the color compoenets to show only the red
image(:, 1:(columns/3), 1);
image(:, 1:(columns/3), 2)=0;
image(:, 1:(columns/3), 3)=0;

% turn off the color compoenets to show only the green
image(:, (columns/3) + 1:2 * (columns/3), 1)=0;
image(:, (columns/3) + 1:2 * (columns/3), 3)=0;

% turn off the color compoenets to show only the blue
image(:, 2 * (columns/3) + 1:3 * (columns/3), 1)=0;
image(:, 2 * (columns/3) + 1:3 * (columns/3), 2)=0;

% show de image
imshow(image)
