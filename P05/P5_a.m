clc
clear all
close all
warning off all

%%authors: Ethel Padilla y Eliot Valdés

% Leyendo el histograma de una imagen
img = imread('peppers.png');
figure(1);

%%mostramos la imagen original junto con su histograma
subplot(2,2,1);
imshow(img);
title('imagen original');
subplot(2,2,2);
imhist(img);
title('histograma de la imagen');

%%ecualizamos la imagen
img_equalizada = histeq(img);

% Calcular el histograma ecualizado
subplot(2, 2, 3)
imshow(img_equalizada)
title('Imagen Ecualizada')
subplot(2, 2, 4)
imhist(img_equalizada);
title('Histograma Ecualizado')
