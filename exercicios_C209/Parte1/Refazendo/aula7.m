%% Espelhamento em X
clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

for i=1:linhas
    for j=1:colunas
        new_x = (linhas-i) + 1;
        
        image_x(new_x, j, 1) = image(i,j,1);
        image_x(new_x, j, 2) = image(i,j,2);
        image_x(new_x, j, 3) = image(i,j,3);
    end;
end;

image_x = uint8(image_x);
imshow(image_x);

%% Espelhamento em Y
clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

for i=1:linhas
    for j=1:colunas
        new_y = (colunas-j) + 1;
        
        image_y(i, new_y, 1) = image(i,j,1);
        image_y(i, new_y, 2) = image(i,j,2);
        image_y(i, new_y, 3) = image(i,j,3);
    end;
end;

image_y = uint8(image_y);
imshow(image_y);

%% Cisalhamento
clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

bx = 0.6;
by = 0.3;

for i=1:linhas
    for j=1:colunas
        x = j;
        y = i;
        
        new_x = round(x + bx*y);
        new_y = round(by*x + y);
        
        image_final(new_y, new_x, :) = image(i,j,:);
    end;
end;

image_final = uint8(image_final);
imshow(image_final);
