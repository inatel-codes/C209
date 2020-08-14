%% Convertendo imagem RGB para HSV
clc
clear

image = imread('jayce.jpg');
[linha coluna pagina] = size(image);

for i=1:linha
    for j=1:coluna
        R = double(image(i,j,1));
        G = double(image(i,j,2));
        B = double(image(i,j,3));
        
        A = [R G B];
        
        if (max(A)- min(A)) ~= 0
            if max(A) == R && G >= B
                H = (60*((G-B)/(max(A)- min(A))))+ 0;
            elseif max(A) == R && G < B
                H = (60*((G-B)/(max(A)- min(A))))+ 360;
            elseif max(A) == G
                H = (60*((B-R)/(max(A)- min(A))))+ 120;
            elseif max(A) == B 
                H = (60*((R-G)/(max(A)- min(A))))+ 240;
            end;
        else
            h = 0;
        end;
        
        if max([R G B]) ~= 0
            S = (max([R G B]) - min([R G B]))/(max([R G B]));
        else
            S = 0;
        end;
            
        V = max([R G B]);
        
        image_HSV(i,j,1) = H/360;
        image_HSV(i,j,2) = S;
        image_HSV(i,j,3) = V/255;
    end;
end;
image_RGB = hsv2rgb(image_HSV);
imshow(image_RGB);
figure(2);
imshow(image);