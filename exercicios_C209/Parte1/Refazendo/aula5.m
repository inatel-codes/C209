%% RGB TO HSV
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
        
        if (max(A) - min(A)) == 0
            H = 0;
        else
            if max(A) == R && G >= B
                H = 60*((G-B)/(max(A) - min(A)));
            elseif max(A) == R && G < B
                H = (60*((G-B)/(max(A) - min(A)))) + 360;
            elseif max(A) == G
                H = (60*((B-R)/(max(A) - min(A)))) + 120;
            elseif max(A) == B
                H = (60*((R-G)/(max(A) - min(A)))) + 240;  
            end;
        end;
        
        if max(A) == 0 
            S = 0;
        else
            S = (max(A) - min(A))/max(A);
        end;
 
        V = max(A);
        
        image_HSV(i,j,1) = H/360;
        image_HSV(i,j,2) = S;
        image_HSV(i,j,3) = V/255;
        
        
    end;
end;

image_RGB = hsv2rgb(image_HSV);
imshow(image_RGB);

