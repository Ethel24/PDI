%clc
clear all
close all
warning off all

%%authors: Ethel Padilla y Eliot Valdés

img = imread('peppers.png');
gray_img = rgb2gray(img);
img_dct = dct2(gray_img);

% Tamaño de la imagen
[rows, cols] = size(gray_img);
block_size = 8;

% Padding: Rellenar con ceros las franjas de la imagen para que sus dimensiones sean multiplo exacto de 8 
padded_img = padarray(gray_img, [mod(block_size - mod(rows, block_size), block_size), mod(block_size - mod(cols, block_size), block_size)]);

% Aplicación de la DCT en bloques y DPCM para el coeficiente DC
dct_blocks = zeros(size(padded_img)); %Esta matriz se utilizará para almacenar los coeficientes DCT calculados en bloques.
for i = 1:block_size:size(padded_img, 1)
    for j = 1:block_size:size(padded_img, 2)
        %%Se extrae un bloque ubicado en las coordenadas (i, j)
        block = padded_img(i:i+block_size-1, j:j+block_size-1);
        %%Se calcula la DCT del bloque 
        dct_block = dct2(block);
        dct_blocks(i:i+block_size-1, j:j+block_size-1) = dct_block;
    end
end

dc_coefficients = dct_blocks(1:block_size:end, 1:block_size:end);
%%Se resta cada coeficiente DC con el coeficiente DC del bloque anterior en la misma columna. 
dc_coefficients_dpcm = dc_coefficients - [zeros(1, size(dc_coefficients, 2)); dc_coefficients(1:end-1, :)];

% Cuantificación
bits = input('Bits para reducir: ');
no_intervals = 2^bits;

if no_intervals <= 0
    error('El número de bits debe ser mayor que cero.')
end

%calcula el tamaño del intervalo de cuantificación y ajusta cada coeficiente a uno de estos intervalos
interval_size = ((max(max(dc_coefficients_dpcm)) - min(min(dc_coefficients_dpcm)))) / no_intervals;
quantized_dc_coefficients_dpcm = round(dc_coefficients_dpcm / interval_size) * interval_size;


% Reconstrucción del coeficiente DC e IDCT en bloques
%reconstruir la imagen después de haber cuantificado los coeficientes DC y aplicado la DCT a los bloques de la imagen original. 
reconstructed_dc_coefficients = cumsum([dc_coefficients(1, 1), quantized_dc_coefficients_dpcm(1, 2:end); quantized_dc_coefficients_dpcm(2:end, :)], 1);
reconstructed_dct_blocks = dct_blocks;
reconstructed_dct_blocks(1:block_size:end, 1:block_size:end) = reconstructed_dc_coefficients;
reconstructed_img = zeros(size(gray_img));
for i = 1:block_size:size(reconstructed_dct_blocks, 1)
    for j = 1:block_size:size(reconstructed_dct_blocks, 2)
        block = reconstructed_dct_blocks(i:i+block_size-1, j:j+block_size-1);
        idct_block = round(idct2(block));
        reconstructed_img(i:i+block_size-1, j:j+block_size-1) = idct_block;
    end
end


% Muestra la imagen recuperada
subplot(1, 2, 1);
imshow(gray_img);
title('Original');

subplot(1, 2, 2);
imshow(reconstructed_img, []);
title('Recuperada');


%Calculamos el S/N:
Arriba = double(gray_img);
Arriba = Arriba.^2;
Abajo = (double(gray_img)-double(reconstructed_img));
Abajo = Abajo.^2; 
Arall = sum(Arriba,'all');
Aball = sum(Abajo,'all');

Dentro=(Arall/Aball);
casiF = log10(Dentro);
final = 10*casiF;

disp(final);
 
