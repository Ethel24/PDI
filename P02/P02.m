clc
close all
warning off all

%%authors: Ethel Padilla y Eliot Valdés

% Leer la imagen 'peppers.png'
a = imread('peppers.png');

% Solicitar el número de clases a identificar en la imagen
n_clases = input('Ingrese el número de clases a identificar en la imagen: ');

% Solicitar el número de iteraciones para cada clase
iter = input('Ingrese el número de iteraciones para cada clase: ');

% Pedir el nombre de cada clase
class_names = cell(1, n_clases);
for i = 1:n_clases
    class_names{i} = input(['Ingrese el nombre de la clase ', num2str(i), ': '], 's');
end

% Inicializar una celda para almacenar los valores de píxeles de cada clase
class_pixels = cell(1, n_clases);

% Capturar los valores de píxeles para cada clase
for i = 1:n_clases
    % Mostrar la imagen y permitir al usuario seleccionar puntos para la clase
    figure('Name', ['Seleccionar puntos para la clase ', class_names{i}], 'NumberTitle', 'off');
    imshow(a);
    title(['Seleccionar puntos para la clase ', class_names{i}]);
    
    % Inicializar una matriz para almacenar los valores de píxeles de la clase actual
    class_pixels{i} = zeros(iter, 3); % RGB tiene 3 canales
    
    for j = 1:iter
        % Usar impixel para obtener el valor de píxel
        [x, y] = ginput(1); % Obtener una coordenada del usuario
        pixel_value = impixel(a, x, y); % Obtener el valor de píxel en esa coordenada
        
        % Guardar el valor de píxel en la matriz
        class_pixels{i}(j, :) = pixel_value;
    end
    
    % Cerrar la figura actual
    close;
end

% Calcular el promedio de cada clase
class_means = cell(1, n_clases);
for i = 1:n_clases
    class_means{i} = mean(class_pixels{i});
end

while true
    % Solicitar al usuario que seleccione un punto 'pointxy' dentro de la imagen
    figure('Name', 'Seleccionar punto en la imagen', 'NumberTitle', 'off');
    imshow(a);
    title('Seleccionar un punto en la imagen');
    
    [x, y] = ginput(1); % Obtener una coordenada del usuario
    
    % Obtener la distancia del punto 'pointxy' a cada uno de los promedios de las clases
    distances = zeros(1, n_clases);
    for i = 1:n_clases
        distances(i) = norm(double(impixel(a, x, y)) - class_means{i});
    end
    
    % Obtener la clase a la que pertenece el punto 'pointxy' usando una estructura 'if'
    [~, class_index] = min(distances);
    
    % Mostrar la clase a la que pertenece el punto
    disp(['El punto seleccionado pertenece a la clase: ', class_names{class_index}]);
    
    % Preguntar al usuario si desea seleccionar otro punto
    choice = input('¿Desea seleccionar otro punto? (Sí=1, No=0): ');
    
    if choice == 0
        break; % Salir del bucle si el usuario no desea seleccionar otro punto
    end
end