%% Aplicando HDR as imagens
clc 
clear

image1 = imread('IMG_1335.jpg');
image2 = imread('IMG_1336.jpg');
image3 = imread('IMG_1337.jpg');
image4 = imread('IMG_1338.jpg');
image5 = imread('IMG_1339.jpg');
image6 = imread('IMG_1340.jpg');
image7 = imread('IMG_1341.jpg');

final_image = double(image1) + double(image2) + double(image3) + double(image4) + double(image5) + double(image6) + double(image7);
final_image = final_image/7;
final_image = uint8(final_image);

imshow(final_image);

%% Blanding
image_for_blanding = imread('lol_map_for_blanding.jpg');
image_resultante = 0.6*double(final_image) + 0.4*double(image_for_blanding);
image_resultante = uint8(image_resultante);

imshow(image_resultante);