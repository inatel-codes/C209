%% HDR
clc
clear

image1 = imread('IMG_1335.jpg');
image2 = imread('IMG_1336.jpg');
image3 = imread('IMG_1337.jpg');
image4 = imread('IMG_1338.jpg');
image5 = imread('IMG_1339.jpg');
image6 = imread('IMG_1340.jpg');
image7 = imread('IMG_1341.jpg');

image_final = double(image1) + double(image2) + double(image3) + double(image4) + double(image5) + double(image6) + double(image7);
image_final = image_final/7;
image_final = uint8(image_final);
imshow(image_final);

%% Blending
image_for_blen = imread('lol_map_for_blanding.jpg');

image_blen = 0.5*image_final + 0.5*image_for_blen;
image_blen = uint8(image_blen);
imshow(image_blen);
