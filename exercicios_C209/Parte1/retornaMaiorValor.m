%Exercicio 6
function maior = retornaMaiorValor(array)
[linhas, colunas, paginas] = size(array);
maior = 0;

for i = 1:linhas
    for j = 1:colunas
        for y = 1:paginas 
            if array(i, j, y) > maior
                maior = array(i, j, y);
            end
        end
    end
end

maior;

end