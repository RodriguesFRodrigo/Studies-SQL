-- Comparações com o valor NULL retornam o unknown que é tratado como false.

-- Deleta todas as linhas em que column tem o valor null
delete from table where column = null;

-- Testing for null: is [not] null
is null -- Retorna true se é null
is not null -- Retorna false se não é null

-- Comparison
null = null -- retorna unknown, comparar null usando = é indeterminado

-- Usando is distinct e is not distinct
    -- null com null são iguais
    -- null com outro valor são diferentes
select * from table where column is not distinct null
select * from table where column is distinct null
