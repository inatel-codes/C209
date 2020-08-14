clc
clear

image = imread('morgana.jpg');
[linha coluna pagina] = size(image);

%% Espelhamento em x
for i=1:linha
    for j=1:coluna
        newX = (linha - i)+1;
        
        image_espelhada_x(newX,j,1) = image(i,j,1);
        image_espelhada_x(newX,j,2) = image(i,j,2);
        image_espelhada_x(newX,j,3) = image(i,j,3);
    end;
end;

image_espelhada_x = uint8(image_espelhada_x);
imshow(image_espelhada_x);

%% Espelhamento em y
for i=1:linha
    for j=1:coluna
        newY = (coluna - j)+1;
        
        image_espelhada_y(i,newY,1) = image(i,j,1);
        image_espelhada_y(i,newY,2) = image(i,j,2);
        image_espelhada_y(i,newY,3) = image(i,j,3);
    end;
end;

image_espelhada_y = uint8(image_espelhada_y);
imshow(image_espelhada_y);

%% Cisalhamento
for i=1:linha
    for j=1:coluna
        x = i;
        y = j;
        bx = 0.8;
        by = 0.4;
        
        matriz1 = [1 bx; by 1];
        matriz2 = [x; y];
        
        matriz_resultante = matriz1*matriz2;
        x_linha = round(matriz_resultante(1,1));
        y_linha = round(matriz_resultante(2,1));
        
        image_cisalhada(x_linha,y_linha,1) = image(i,j,1);
        image_cisalhada(x_linha,y_linha,2) = image(i,j,2);
        image_cisalhada(x_linha,y_linha,3) = image(i,j,3);
    end;
end;

image_cisalhada = uint8(image_cisalhada);
imshow(image_cisalhada);

%% Rotação
alfa = pi/4;

for i=1:linha
    for j=1:coluna
        newX = uint16(cos(alfa)*j -sin(alfa)*i) + 1;
        newY = uint16(sin(alfa)*j + cos(alfa)*i) + 1;
        
        image_rot(newY, newX, :) = image(i,j,:); 
    end;
end;

image_rot = uint8(image_rot);
imshow(image_rot);

%% Escala
s = 0.5;

for i=1:linha
    for j=1:coluna
        newX = round(s*j);
        newY = round(s*i);
        
        image_esc(newY, newX, :) = image(i,j,:); 
    end;
end;

image_esc = uint8(image_esc);
imshow(image_esc);
