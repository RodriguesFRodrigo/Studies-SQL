-- Subconsultas single-row
 -- A subconsulta deve retornar apenas uma linha
 -- A subconsulta é executada antes da consulta principal
 -- O resultado da subconsulta é utilizado pela consulta principal

-- Casos de uso
-- Quais empregados possuem o salário maior do que a média de salários?
  -- Primeiro precisamos achar a média (subconsulta)
  -- Utilizar subconsulta para achar os salários maiores que a média

select 
  first_name, 
  last_name, 
  job_id, 
  salary
from rodrigo_rodrigues.employees
where salary > (select avg(nvl(salary, 0)) -- Single row
                from rodrigo_rodrigues.employees);

-- Utilizando Sub-consultas na Cláusula HAVING
-- Agrupa os departamentos pelo maior salário e restringe os departamentos em que o maior salário seja menor que a média salarial.

select 
  e1.department_id, 
  max(e1.salary)
from rodrigo_rodrigues.employees e1
group by e1.department_id
having max(salary) < (select avg(e2.salary)
                      from employees e2)

-- Erros utilizando Sub-consultas Single-Row

select 
  employee_id, 
  first_name, 
  last_name
from employees
where salary = (select avg(nvl(salary,0)) -- Não é um resultado single-row
                from employees
                group by department_id);