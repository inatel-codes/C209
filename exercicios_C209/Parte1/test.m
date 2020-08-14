clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

dx = 30;
dy = 100;

alfa = pi/6;

for i=1:linhas
    for j=1:colunas
        new_x = j + dx;
        new_y = i + dy;
        
        image_trans(new_y, new_x, :) = image(i,j,:);
    end;
end;


for i=1:linhas
    for j=1:colunas
        new_x = uint16(j*cos(alfa) - i*sin(alfa)) + 1;
        new_y = uint16(j*sin(alfa) + i*cos(alfa)) + 1;
        
        image_rot(new_y, new_x, :) = image_trans(i,j,:);
    end;
end;

image_rot = uint8(image_rot);
imshow(image_rot);