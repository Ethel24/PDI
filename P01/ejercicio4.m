%%PRACTICA 1 EJERCICIO 4
%%Authors: Eliot Valdés, Ethel Padilla

clc
warning off all

% read the image peppers.png and store in a variable image
image = imread('peppers.png');

% get the total number of cols and rows of the image
[rows, cols, numberOfColorChannels] = size(image);

% separate the cols in 6 parts and rows in 5 parts
% the number of cols and rows of each part
colsOfEachPart = floor(cols/6);
rowsOfEachPart = floor(rows/5);

% ROW 1
% the area1 will be converted to red color
image(1:rowsOfEachPart, 1:colsOfEachPart, 2) = 0;
image(1:rowsOfEachPart, 1:colsOfEachPart, 3) = 0;

% the area2 will be converted to red
image(1:rowsOfEachPart, colsOfEachPart+1:colsOfEachPart*2, 2) = 0;
image(1:rowsOfEachPart, colsOfEachPart+1:colsOfEachPart*2, 3) = 0;

% the area3 will be converted to blue
image(1:rowsOfEachPart, colsOfEachPart*2+1:colsOfEachPart*3, 1) = 0;
image(1:rowsOfEachPart, colsOfEachPart*2+1:colsOfEachPart*3, 2) = 0;

% the area4 will be converted to blue
image(1:rowsOfEachPart, colsOfEachPart*3+1:colsOfEachPart*4, 1) = 0;
image(1:rowsOfEachPart, colsOfEachPart*3+1:colsOfEachPart*4, 2) = 0;

% the area5 will be converted to green
image(1:rowsOfEachPart, colsOfEachPart*4+1:colsOfEachPart*5, 1) = 0;
image(1:rowsOfEachPart, colsOfEachPart*4+1:colsOfEachPart*5, 3) = 0;

% the area6 will be converted to green
image(1:rowsOfEachPart, colsOfEachPart*5+1:cols, 1) = 0;
image(1:rowsOfEachPart, colsOfEachPart*5+1:cols, 3) = 0;

% ROW 2
% the area7 will be converted to red
image(rowsOfEachPart+1:rowsOfEachPart*2, 1:colsOfEachPart, 2) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, 1:colsOfEachPart, 3) = 0;

% the area8 will be converted to blue
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart+1:colsOfEachPart*2, 1) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart+1:colsOfEachPart*2, 2) = 0;

% the area9 will be converted to black
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*2+1:colsOfEachPart*3, 1) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*2+1:colsOfEachPart*3, 2) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*2+1:colsOfEachPart*3, 3) = 0;

% the area10 will be converted to black
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*3+1:colsOfEachPart*4, 1) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*3+1:colsOfEachPart*4, 2) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*3+1:colsOfEachPart*4, 3) = 0;

% the area11 will be converted to blue
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*4+1:colsOfEachPart*5, 1) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*4+1:colsOfEachPart*5, 2) = 0;

% the area12 will be converted to green
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*5+1:cols, 1) = 0;
image(rowsOfEachPart+1:rowsOfEachPart*2, colsOfEachPart*5+1:cols, 3) = 0;

% ROW 3
% the area13 will be converted to red
image(rowsOfEachPart*2+1:rowsOfEachPart*3, 1:colsOfEachPart, 2) = 0;
image(rowsOfEachPart*2+1:rowsOfEachPart*3, 1:colsOfEachPart, 3) = 0;

% the area14 will be converted to blue
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart+1:colsOfEachPart*2, 1) = 0;
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart+1:colsOfEachPart*2, 2) = 0;

% the area15 will be converted to blue
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*2+1:colsOfEachPart*3, 1) = 0;
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*2+1:colsOfEachPart*3, 2) = 0;

% the area16 will be converted to blue
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*3+1:colsOfEachPart*4, 1) = 0;
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*3+1:colsOfEachPart*4, 2) = 0;

% the area17 will be converted to blue
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*4+1:colsOfEachPart*5, 1) = 0;
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*4+1:colsOfEachPart*5, 2) = 0;

% the area18 will be converted to green
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*5+1:cols, 1) = 0;
image(rowsOfEachPart*2+1:rowsOfEachPart*3, colsOfEachPart*5+1:cols, 3) = 0;

% ROW 4
% the area19 will be converted to red
image(rowsOfEachPart*3+1:rowsOfEachPart*4, 1:colsOfEachPart, 2) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, 1:colsOfEachPart, 3) = 0;

% the area20 will be converted to blue
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart+1:colsOfEachPart*2, 1) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart+1:colsOfEachPart*2, 2) = 0;

% the area21 will be converted to black
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*2+1:colsOfEachPart*3, 1) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*2+1:colsOfEachPart*3, 2) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*2+1:colsOfEachPart*3, 3) = 0;

% the area22 will be converted to black
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*3+1:colsOfEachPart*4, 1) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*3+1:colsOfEachPart*4, 2) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*3+1:colsOfEachPart*4, 3) = 0;

% the area23 will be converted to blue
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*4+1:colsOfEachPart*5, 1) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*4+1:colsOfEachPart*5, 2) = 0;

% the area24 will be converted to green
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*5+1:cols, 1) = 0;
image(rowsOfEachPart*3+1:rowsOfEachPart*4, colsOfEachPart*5+1:cols, 3) = 0;

% ROW 5
% the area25 will be converted to red
image(rowsOfEachPart*4+1:rowsOfEachPart*5, 1:colsOfEachPart, 2) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, 1:colsOfEachPart, 3) = 0;

% the area26 will be converted to blue
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart+1:colsOfEachPart*2, 1) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart+1:colsOfEachPart*2, 2) = 0;

% the area27 will be converted to black
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*2+1:colsOfEachPart*3, 1) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*2+1:colsOfEachPart*3, 2) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*2+1:colsOfEachPart*3, 3) = 0;

% the area28 will be converted to black
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*3+1:colsOfEachPart*4, 1) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*3+1:colsOfEachPart*4, 2) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*3+1:colsOfEachPart*4, 3) = 0;

% the area29 will be converted to blue
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*4+1:colsOfEachPart*5, 1) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*4+1:colsOfEachPart*5, 2) = 0;

% the area30 will be converted to green
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*5+1:cols, 1) = 0;
image(rowsOfEachPart*4+1:rowsOfEachPart*5, colsOfEachPart*5+1:cols, 3) = 0;

imshow(image)