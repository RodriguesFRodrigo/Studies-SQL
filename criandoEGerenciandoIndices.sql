-- É uma estrutura/objeto separado da tabela
-- Serve para otimizar a recuperação de linhas da tabela
-- Em alguns casos para recuperar linha o oracle precisa fazer um full scan (consultar todas as linhas) para satisfazer as condições do where
-- Pode ser utilizado para aumentar a perfomance de recuperação das linhas da tabela

-- Quando os índices são criados
-- Automaticamente na definição de uma primary key / unique
-- Manualmente: criado para outras colunas que não são primary key ou unique, e que são utilizados com frequencia na clausula where
-- Também é uma boa pratica criar para colunas foreign key