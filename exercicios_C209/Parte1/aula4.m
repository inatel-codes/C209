clc 
clear

image = imread('morgana.jpg');
[linha coluna pagina] = size(image);

%% Usando método Lightness para converter imagem em grayscale
for i=1:linha
    for j=1:coluna
        R = image(i,j,1);
        G = image(i,j,2);
        B = image(i,j,3);
        
        image_grayscale(i,j) = (max([R G B]) + min([R G B]))/2;
    end;
end;

image_grayscale = uint8(image_grayscale);
imshow(image_grayscale);

%% Usando método Average para converter imagem em binária
for i = 1:linha
    for j = 1:coluna
        R = image(i,j,1);
        G = image(i,j,2);
        B = image(i,j,3);
        
        image_binaria(i,j) = (R + G + B)/3;
        
        % O limiar (80) depende da imagem
        if image_binaria(i,j) > 80
            image_binaria(i,j) = 255;
        else
            image_binaria(i,j) = 0;
        end;
        
    end;
end;

image_binaria = uint8(image_binaria);
imshow(image_binaria);

%% Convertendo imagem para espectro monocromático
for i=1:linha
    for j=1:coluna
        R = image(i,j,1);
        G = image(i,j,2);
        B = image(i,j,3);
        
        image_monocromatica1(i,j,1) = 0;
        image_monocromatica1(i,j,2) = 0;
        image_monocromatica1(i,j,3) = 0.21*R + 0.72*G + 0.07*B;
        
        image_monocromatica2(i,j,1) = 0.21*R + 0.72*G + 0.07*B;
        image_monocromatica2(i,j,2) = 0;
        image_monocromatica2(i,j,3) = 0;
    end;
end;

image_monocromatica = image_monocromatica1*0.5 + image_monocromatica2*0.5;
image_monocromatica = uint8(image_monocromatica);
imshow(image_monocromatica);
