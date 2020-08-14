%% Histograma
clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

histogram_red = zeros(1, 256);
histogram_green = zeros(1, 256);
histogram_blue = zeros(1, 256);

for i=1:linhas
    for j=1:colunas
        intensity_red = double(image(i,j,1)) + 1;
        histogram_red(intensity_red) = histogram_red(intensity_red) + 1;
        
        intensity_green = double(image(i,j,2)) + 1;
        histogram_green(intensity_green) = histogram_green(intensity_green) + 1;
        
        intensity_blue = double(image(i,j,3)) + 1;
        histogram_blue(intensity_blue) = histogram_blue(intensity_blue) + 1;
    end;
end;

bar(histogram_red, 'r');
hold on
bar(histogram_green, 'g');
bar(histogram_blue, 'b');

%% Equalização
clc
clear

image = imread('grayscale_image.jpg');
[linhas colunas paginas] = size(image);

h = zeros(1, 256);
H = zeros(1, 256);

for i=1:linhas
    for j=1:colunas
        intensity = double(image(i,j)) + 1;
        h(intensity) = h(intensity) + 1;
    end;
end;

for n=2:256
    H(n) = H(n-1) + h(n);
end;

for i=1:linhas
    for j=1:colunas
        intensity = double(image(i,j)) + 1;
       
        image_final(i,j) = round(((H(intensity) - min(H))/((linhas*colunas) - min(H)))*255);
    end;
end;

image_final = uint8(image_final);
imshow(image_final);
figure(2);
imshow(image);
