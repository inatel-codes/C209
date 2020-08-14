clc
clear

%Exercicio 1
array1 = rand(5,5,3); %array 1 5x5x3
array2 = rand(5,5,3); %array 2 5x5x3

%Exercicio 2
arrayResult = array1 .* array2; %multiplicando os dois arrays

%Exercicio 3
arrayResult = arrayResult./2; %dividindo o array resultante por 2

%Exercicio 4
subArray = arrayResult(1:5, 1:3, 1:3); %guardando subarray do resultado 

%Exercicio 5
arrayConcat = [arrayResult subArray]; %concatenando arrays

%Exercicio 7
maiorValor = retornaMaiorValor(arrayConcat); %retornando o maior valor dentro do array 

