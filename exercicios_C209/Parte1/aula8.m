%% Transformando imagens em imagens binárias
clc 
clear

image1 = imread('morgana.jpg');
image2 = imread('lol_map_equal_morgana.jpg');
[linha1 coluna1 pagina1] = size(image1);
[linha2 coluna2 pagina2] = size(image2);

for i=1:linha1
    for j=1:coluna1
        R = double(image1(i,j,1));
        G = double(image1(i,j,2));
        B = double(image1(i,j,3));
   
        image_grayscale(i,j) = (R + G + B)/3;
        
        if image_grayscale(i,j) > 50
            image_binaria1(i,j) = 255;
        else
            image_binaria1(i,j) = 0;
        end;
    end;
end;

for i=1:linha2
    for j=1:coluna2
        R = double(image2(i,j,1));
        G = double(image2(i,j,2));
        B = double(image2(i,j,3));
   
        image_grayscale(i,j) = (R + G + B)/3;
        
        if image_grayscale(i,j) > 50
            image_binaria2(i,j) = 255;
        else
            image_binaria2(i,j) = 0;
        end;
    end;
end;
image_binaria1 = uint8(image_binaria1);
image_binaria2 = uint8(image_binaria2);

%% NOT
image1_not = bitcmp(image_binaria1);
image2_not = bitcmp(image_binaria2);
image2_not = uint8(image2_not);
image1_not = uint8(image1_not);

imshow(image1_not);
figure(2);
imshow(image2_not);

%% AND
image_and = bitand(image_binaria1, image_binaria2);
image_and = uint8(image_and);
imshow(image_and);

%% OR
image_or = bitor(image_binaria1, image_binaria2);
image_or = uint8(image_or);
imshow(image_or);

%% XOR
image_xor = bitxor(image_binaria1, image_binaria2);
image_xor = uint8(image_xor);
imshow(image_xor);

%% Macara de bits
image_white(1:708, 1:1200) = 0;
image_white(1:300, 620:1170) = 255;
image_white = uint8(image_white);

image_resultante = bitand(image1, image_white);
image_resultante = uint8(image_resultante);
imshow(image_resultante);
