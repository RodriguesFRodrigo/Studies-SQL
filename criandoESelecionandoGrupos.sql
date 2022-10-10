-- Criando e Selecionando Grupos
-- Sequência Lógica
    -- 1. WHERE: Aplica a claúsura where para restringir as linhas retornadas
    -- 2. GROUP BY: Forma os grupos
    -- 3. HAVING: Restringir os grupos a serem exibidos
    -- 4. Exibir colunas ou expressões do select ordernado pelo critério definido na cláusura order by

-- Para cada department_id terá um grupo e para cada grupo será exibido avg(salary)
select department_id, avg(salary)
from rodrigo_rodrigues.employees
group by department_id;

-- Somente é possível exibir colunas/expressões na claúsula group by ou colunas/expressões com funções de grupo
-- Cria um grupo department_id/job_id e para cada gryoi serpa exibido o avg(salary)
select department_id, job_id, sum(salary)
from rodrigo_rodrigues.employees
group by department_id, job_id
order by department_id, job_id;

-- Não podemos usar funções de grupo na cláusura where, pois os grupos ainda não foram formados
-- Para resolver este problema devemos usar a cláusura having

select department_id, max(salary)
from rodrigo_rodrigues.employees
-- Os grupos ainda não foram formados
where max(salary) > 10000
group by department_id;

-- Restrigindo grupos com a cláusura having
select department_id, max(salary)
from   rodrigo_rodrigues.employees
group by department_id
-- Todos os grupos em que a média salarial é maior que 10000
having max(salary)>10000;

-- 1. WHERE: somente as linhas em que o job_id é diferente de 'SA_REP'
-- 2. GROUP BY: cria grupos de job_id e exibe a soma dos salários
-- 3. HAVING: exibe somente os grupos que possuim a soma dos salários maior que 10000
-- 4. ORDERNA: pela soma salarial
select job_id, sum(salary) TOTAL
from   rodrigo_rodrigues.employees
where  job_id <> 'SA_REP'
group by job_id
having sum(salary) > 10000
order by sum(salary);