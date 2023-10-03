clc
clear all
close all
warning off all

%%authors: Ethel Padilla y Eliot Valdés

% Lectura de la imagen
a = imread("mar.jpg");
[m,n,~] = size(a);

cielo = input('Ingrese el número de puntos que desea en el cielo: ');
mar = input('Ingrese el número de puntos que desea en el mar: ');
arena = input('Ingrese el número de puntos que desea en la arena: ');

figure;
imshow(a); % Mostrar la imagen

% Generando las coordenadas con números aleatorios
c1x = randi([10, n - 10], 1, cielo);
c1y = randi([10, round(m / 3)], 1, cielo);

c2x = randi([10, n - 10], 1, mar);
c2y = randi([round(m / 3) + 1, round(2 * m / 3)], 1, mar);

c3x = randi([10, n - 10], 1, arena);
c3y = randi([round(2 * m / 3) + 1, m - 10], 1, arena);

% Asignar los valores RGB de los planos
hold on;
grid on;
z1 = impixel(a, c1x, c1y);
plot(c1x, c1y, 'ob', 'Markersize', 5, 'MarkerFaceColor', 'b');

z2 = impixel(a, c2x, c2y);
plot(c2x, c2y, 'or', 'Markersize', 5, 'MarkerFaceColor', 'r');

z3 = impixel(a, c3x, c3y);
plot(c3x, c3y, 'og', 'Markersize', 5, 'MarkerFaceColor', 'g');

total_cielo = mean(z1); % Usar mean en lugar de sum y round
total_mar = mean(z2);
total_arena = mean(z3);

% Lectura de datos de usuario
usuario = 0;
while usuario == 0
    clear desconocido;
    figure(2);
    desconocido = impixel(a);
    
    figure(3);
    % Guardamos la información sobre el plano
    plot3(total_mar(1), total_mar(2), total_mar(3), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
    grid on;
    hold on;
    plot3(total_arena(1), total_arena(2), total_arena(3), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'g')
    plot3(total_cielo(1), total_cielo(2), total_cielo(3), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'b')
    plot3(desconocido(1), desconocido(2), desconocido(3), 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k')
    
    plot3(z3(:,1), z3(:,2), z3(:,3), 'go', 'MarkerSize', 5, 'MarkerFaceColor', 'g')
    plot3(z2(:,1), z2(:,2), z2(:,3), 'ro', 'MarkerSize', 5, 'MarkerFaceColor', 'r')
    plot3(z1(:,1), z1(:,2), z1(:,3), 'bo', 'MarkerSize', 5, 'MarkerFaceColor', 'b')
    
    legend('Mar', 'Arena', 'Cielo', 'Desconocido')
    
    distancia_mar = norm(total_mar - desconocido);
    distancia_cielo = norm(total_cielo - desconocido);
    distancia_arena = norm(total_arena - desconocido);
    
    arreglo_distancias = [distancia_cielo, distancia_mar, distancia_arena];
    [min_distancia, indice] = min(arreglo_distancias);
    
    if indice == 2
        disp('El punto coincide con mar')
    elseif indice == 1
        disp('El punto coincide con cielo')
    else
        disp('El punto coincide con la arena')
    end
    
    usuario = input('Introduzca 0 si quiere verificar otro pixel o 1 si quiere salir: ');
end

disp('Fin del programa, gracias por usarlo :)')
