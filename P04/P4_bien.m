clc
clear all
close all
warning off all

%%authors: Ethel Padilla y Eliot Valdés

% Leyendo el histograma de una imagen
img = imread('peppers.png');
a = double(img);
opc = 0;

while opc == 0
    [filas,columnas,colores] = size(a);
    % Solicitar al usuario que ingrese los límites para ajustar
    disp('Ingrese los límites que desea ajustar');
    minimo = input('Ingrese el límite inferior:');
    maximo = input('Ingrese el límite superior:');
    
    % Obtener los valores mínimos y máximos de cada componente RGB
    min_RGB = min(min(a, [], 1), [], 2);
    max_RGB = max(max(a, [], 1), [], 2);

    New(:,:,1) = (((a(:,:,1)-min_RGB(1)) / (max_RGB(1)-min_RGB(1))) * (maximo-minimo)) + minimo;
    New(:,:,2) = (((a(:,:,2)-min_RGB(2)) / (max_RGB(2)-min_RGB(2))) * (maximo-minimo)) + minimo;
    New(:,:,3) = (((a(:,:,3)-min_RGB(3)) / (max_RGB(3)-min_RGB(3))) * (maximo-minimo)) + minimo;
    z = round(New);
    pixeles = uint8(z); % obtiene los valores de los píxeles en la ubicación (i,j)
    
    % Mostrando la imagen original
    figure(1)
    subplot(5, 2, 1)
    imshow(img)
    title('Imagen Original')
    % Mostrando el histograma original
    % El histograma representa la distribución de intensidades de píxeles en la imagen
    subplot(5, 2, 2)
    bar(imhist(img));
    title('Histograma Original')
    
    % Mostrar la imagen resultante
    subplot(5, 2, 3)
    imshow(pixeles)
    title('Imagen Resultante')
    % Mostrar el histograma expandido
    subplot(5, 2, 4)
    bar(imhist(pixeles));
    title('Histograma Resultante')
    
    subplot(5,2,5);
    imshow(pixeles(:,:,1));
    title('Gris R');
    
    subplot(5,2,7);
    imshow(pixeles(:,:,2));
    title('Gris G');
    
    subplot(5,2,9);
    imshow(pixeles(:,:,3));
    title('Gris B');
    
    % Convertir la imagen a escala de grises y componentes RGB separadas
    bw = rgb2gray(pixeles); % Convierte la imagen en escala de grises
    bw_r = pixeles(:,:,1);
    bw_g = pixeles(:,:,2);
    bw_b = pixeles(:,:,3);

    subplot(5,2,6);
    bar(imhist(bw_r), 'FaceColor', 'r'); % muestra el histograma
    title('GrayR');

    subplot(5,2,8);
    bar(imhist(bw_g), 'FaceColor', 'g'); % muestra el histogramas
    title('GrayG');

    subplot(5,2,10);
    bar(imhist(bw_b), 'FaceColor', 'b'); % muestra el histograma
    title('GrayB');

    % Preguntar al usuario si quiere verificar otros datos o salir
    opc = input('Introduzca 0 si quiere verificar otros datos o 1 si quiere salir:');
end
disp('Fin del programa')
