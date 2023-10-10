clc
clear all
close all
warning off all

%% authors: Ethel Padilla y Eliot Valdés

opc = 0;
while opc == 0
    %%Leemos las imagenes que vamos a utilizar
    img1 = imread('peppers.png');
    img2 = imread('paisaje2.jpg');
    
    figure(1);
    subplot(1,2,1)
    imshow(img1);
    title('imagen1');
    subplot(1,2,2)
    imshow(img2);
    title('imagen2');

    %Solicitamos la imagen que desea usar de referencia
    img_opc = input('Que imagen quiere usar como base: ')
    if img_opc == 1
        imagenx = img1;
        imageny = img2;
    elseif img_opc == 2
        imagenx = img2;
        imageny = img1;
    end

    %% ecualizamos la imagen
    %% función imhistmatch() ecualiza el histograma de la imagen de referencia para que sea similar al otro histograma

    img_ecualizada = imhistmatch(imageny, imagenx);

    %%mostramos las imagenes y sus histogramas
    figure(2);
    subplot(2,4,1);
    imshow(img1);
    title('primer imagen');
    subplot(2,4,5);
    imhist(img1);
    title('histograma de la primer imagen');

    subplot(2,4,2);
    imshow(img2);
    title('segunda imagen');
    subplot(2,4,6);
    imhist(img2);
    title('histograma de la segunda imagen');

    subplot(2,4,3);
    imshow(imagenx);
    title('Imagen elegida de referencia:');
    subplot(2,4,7);
    imhist(imagenx);
    title('Histograma base:')

    subplot(2,4,4);
    imshow(img_ecualizada);
    title('imagen ecualizada');
    subplot(2,4,8);
    imhist(img_ecualizada);
    title('Histograma Ecualizado');
    opc = input('Introduzca 0 si quiere calcular otra vez o 1 si quiere salir: ');

end
disp('fin del programa')
