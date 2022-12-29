----- Comando Insert para multiplas tabelas -----

-- Se não utilizarmos o comando insert para múltiplas tabelas, 
-- nós precisaremos recuperar (região física / ponteiro / memória) os mesmos dados para cada comando INSERT executando comando separadamente e isto aumentará a carga de trabalho.
-- Insert multiple tables melhoram a perfomance

------ INSERT ALL - Incondicional -----
-- Cada linha retornada pelo subconsulta (subquery) é inserida para cada uma das tabelas destino (target)

drop table rodrigo_rodrigues.salary_history;

-- Cria uma tabela chamada salary_history como resultado de um select.
create table rodrigo_rodrigues.salary_history
as
select employee_id, extract(year from hire_date) year, extract(month from hire_date) month, salary, commission_pct
from rodrigo_rodrigues.employees
where hire_date <= sysdate - 365;

select * from rodrigo_rodrigues.salary_history;