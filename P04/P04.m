clc
clear all
close all
warning off all
%%authors: Ethel Padilla y Eliot Valdés

%Leyendo el histograma de una imagen
a = imread('peppers.png');

%Mostrando la imagen original
figure(1)
subplot(3, 2, 1)
imshow(a)
title('Imagen Original')

%Mostrando el histograma original
%El histograma representa la distribución de intensidades de píxeles en la imagen
subplot(3, 2, 2)
imhist(a)
title('Histograma Original')

%Aplicando expansión al histograma
stretch_factor = 4;  %%Este factor se utilizará para estirar el histograma
expanded_image = uint8(double(a) * stretch_factor);%aumenta la separación entre los valores de intensidad de píxeles 

% Mostrando la imagen expandida
subplot(3, 2, 3)
imshow(expanded_image)
title('Imagen Expandida')

% Mostrando el histograma expandido
subplot(3, 2, 4)
imhist(expanded_image)
title('Histograma Expandido')

% Aplicando compresión al histograma
compression_factor = 0.17;
%Se realiza la compresión multiplicando todos los valores de píxeles de la imagen original por el factor
compressed_image = uint8(double(a) * compression_factor);

% Mostrando la imagen comprimida
subplot(3, 2, 5)
imshow(compressed_image)
title('Imagen Comprimida')

% Mostrando el histograma comprimido
subplot(3, 2, 6)
imhist(compressed_image)
title('Histograma Comprimido')
