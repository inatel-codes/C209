%lendo imagem
image = imread('coins.png');
%% convertendo em escala de cinzas
image =rgb2gray(image);

% achando as bordas
BW1 = edge(image, 'Canny');
BW2 = edge(image, 'Prewitt');

% mostrando imagem das bordas
imshowpair(BW1,BW2,'montage')