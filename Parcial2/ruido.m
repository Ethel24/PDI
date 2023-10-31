clc
clear all
close all
warning off all

% Leer la imagen original
image = imread('peppers.png');
imagen_original = rgb2gray(image);
imagen_original = im2double(imagen_original); % Convertir la imagen a tipo double

% Mostrar la imagen original
subplot(2, 3, 1);
imshow(imagen_original);
title('Imagen Original');

% Agregar ruido a la imagen
imagen_ruidosa = imnoise(imagen_original, 'salt & pepper', 0.05); % Puedes ajustar la intensidad del ruido
subplot(2, 3, 2);
imshow(imagen_ruidosa);
title('Imagen con Ruido');

% Limpiar la imagen utilizando la moda (cálculo manual)
imagen_limpia_moda = imagen_ruidosa;
[m, n] = size(imagen_ruidosa);
mask_size = 3;

for i = 2:m-1
    for j = 2:n-1
        neighborhood = imagen_ruidosa(i-1:i+1, j-1:j+1);
        values = neighborhood(:);
        unique_values = unique(values);
        counts = histc(values, unique_values);
        [max_count, mode_idx] = max(counts);
        mode_value = unique_values(mode_idx);
        imagen_limpia_moda(i, j) = mode_value;
    end
end

subplot(2, 3, 3);
imshow(imagen_limpia_moda);
title('Imagen Limpia (Moda)');

% Limpiar la imagen utilizando la mediana (cálculo manual)
imagen_limpia_mediana = imagen_ruidosa;

for i = 2:m-1
    for j = 2:n-1
        neighborhood = imagen_ruidosa(i-1:i+1, j-1:j+1);
        sorted_neighborhood = sort(neighborhood(:));
        imagen_limpia_mediana(i, j) = sorted_neighborhood(5); % El valor central en la matriz ordenada
    end
end

subplot(2, 3, 4);
imshow(imagen_limpia_mediana);
title('Imagen Limpia (Mediana)');

% Limpiar la imagen utilizando el filtro de mínimos (cálculo manual)
imagen_limpia_minimos = imagen_ruidosa;

for i = 2:m-1
    for j = 2:n-1
        neighborhood = imagen_ruidosa(i-1:i+1, j-1:j+1);
        imagen_limpia_minimos(i, j) = min(neighborhood(:));
    end
end

subplot(2, 3, 5);
imshow(imagen_limpia_minimos);
title('Imagen Limpia (Mínimos)');

% Limpiar la imagen utilizando el filtro de máximos (cálculo manual)
imagen_limpia_maximos = imagen_ruidosa;

for i = 2:m-1
    for j = 2:n-1
        neighborhood = imagen_ruidosa(i-1:i+1, j-1:j+1);
        imagen_limpia_maximos(i, j) = max(neighborhood(:));
    end
end

subplot(2, 3, 6);
imshow(imagen_limpia_maximos);
title('Imagen Limpia (Máximos)');

