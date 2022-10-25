-- Utilizando o operador Exists
  -- Subconsulta precisa ser correlacionada

-- Todos os departamentos que tem empregados
select d.department_id, d.department_name
from departments d
where exists
             (select e.department_id -- Para cada linha da consulta externa (executa interna) verificar sem tem uma correspondência na interna
              from employees e
              where d.department_id = e.department_id); -- Correlacionada

-- /--------------------/

-- Todos os departamentos que não tem empregados
select d.department_id, d.department_name
from departments d
where not exists
             (select e.department_id -- Para cada linha da consulta externa (executa interna) verificar sem tem uma correspondência na interna
              from employees e
              where d.department_id = e.department_id); -- Correlacionada