-- Subconsultas multiple row

-- Utilizando o operador In

-- Salário médio dos departamentos
  -- Podemos agrupar por uma determinada coluna e não selecioná-la
select 
  avg(nvl(salary,0))
from rodrigo_rodrigues.employees
group by department_id;

-- Localiza todos os funcionários cujo salário é maior do que algum salário médio departamental
select employee_id, first_name, last_name
from rodrigo_rodrigues.employees
where salary in (select avg(nvl(salary,0)) -- in (mediadp1, mediadp2, mediadp3, ...), na tupla os valores são dinâmicos resultantes da consulta
                 from rodrigo_rodrigues.employees
                 group by department_id);

-- Localiza todos os funcionários cujo salário é menor do que algum salário médio departamental
select employee_id, first_name, last_name
from rodrigo_rodrigues.employees
where salary not in (select avg(nvl(salary,0)) -- in (mediadp1, mediadp2, mediadp3, ...), na tupla os valores são dinâmicos resultantes da consulta
                 from rodrigo_rodrigues.employees
                 group by department_id);

-- Um erro comum
select employee_id, first_name, last_name
from rodrigo_rodrigues.employees
where salary not in (select department_id, avg(nvl(salary,0)) -- muitos valores na tupla 
                 from rodrigo_rodrigues.employees
                 group by department_id);

-- /--------------------/

-- Utilizando o operador Any