-- Adicionando colunas

-- Exemplo 1:
-- Se houver dados na tabela, a nova coluna terá o valor null em todas as linhas já existentes
-- Commit automatico
alter table rodrigo_rodrigues.projects
add (department_id number(3));

desc rodrigo_rodrigues.projects;

-- Removendo uma coluna
-- Exemplo 2:
-- Commit automatico
alter table rodrigo_rodrigues.projects
drop column department_id;

-- Adicionando uma coluna com constraint
-- Exemplo 3:
-- Como não há dados na tabela não é necessário informar uma valor default
alter table rodrigo_rodrigues.projects
add (department_id number(3)not null);


-- Alterando uma coluna
-- Podemos alterar o tipo de dado
 -- O novo tipo deve garantir conversão implicita
-- Podemos alterar o tamanho do dado
 -- O novo tamanho não pode causar truncamento dos dados já presentes na tabela
alter table rodrigo_rodrigues.projects
modify (project_code varchar2(6));
                             
desc projects

-- Renomeando uma coluna
-- Exemplo 4:
alter table rodrigo_rodrigues.projects
rename column project_code to name;

desc rodrigo_rodrigues.projects;

-- Não permitir comandos DDL e DML na tabela
-- read only
-- Exemplo 5:
alter table employees read only;

-- Permitir comandos DDL e DML na tabela
-- read write
-- Exemplo 6:
alter table employees read write;