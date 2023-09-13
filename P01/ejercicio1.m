%%PRACTICA 1 EJERCICIO 1
%%Authors: Eliot Valdés, Ethel Padilla

clc
warning off all


% read the image peppers.png and store in a variable image
image = imread('peppers.png');

% get the total number of columns
[rows, columns, numberOfColorChannels] = size(image);

% apagamos los demas componentes de color para solo mostrar el rojo
image(1:rows/2,columns/2+1:columns,2)=0;
image(1:rows/2,columns/2+1:columns,3)=0;

% apagamos los componentes para solo mostrar el verde
image(rows/2+1:rows,1:columns/2,1) = 0;
image(rows/2+1:rows,1:columns/2,3) = 0;

% apagamos los componentes para solo mostrar el azul
image(rows/2+1:rows,columns/2+1:columns,1)=0;
image(rows/2+1:rows,columns/2+1:columns,2)=0;

imshow(image)