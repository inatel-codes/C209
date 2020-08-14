%% Grayscale Average
clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

for i=1:linhas
    for j=1:colunas
        R = double(image(i,j,1));
        G = double(image(i,j,2));
        B = double(image(i,j,3));
        
        image_gray(i,j) = (R + G + B)/3;
    end;
end;

image_gray = uint8(image_gray);
imshow(image_gray);

%% Binaria (Luminosity)
clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

for i=1:linhas
    for j=1:colunas
        R = double(image(i,j,1));
        G = double(image(i,j,2));
        B = double(image(i,j,3));
        
        image_gray(i,j) = 0.21*R + 0.72*G + 0.07*B;
        
        if image_gray(i,j) > 90
            image_gray(i,j) = 255;
        else
            image_gray(i,j) = 0;
        end;
    end;
end;

image_gray = uint8(image_gray);
imshow(image_gray);

%% Monocromatica (Lightness)
clc
clear

image = imread('morgana.jpg');
[linhas colunas paginas] = size(image);

for i=1:linhas
    for j=1:colunas
        R = double(image(i,j,1));
        G = double(image(i,j,2));
        B = double(image(i,j,3));
        
        A = [R G B];
        image_gray(i,j) = (max(A) + min(A))/2;
        
        image_mono(i,j,1) = image_gray(i,j);
        image_mono(i,j,2) = 0;
        image_mono(i,j,3) = image_gray(i,j);
    end;
end;
image_mono = uint8(image_mono);
imshow(image_mono);