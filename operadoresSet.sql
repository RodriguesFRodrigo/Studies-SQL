-- Utilizando o operador Union
  -- Elimina as duplicidades
  -- Mais lento que o Union All
  -- Para eliminar as duplicidades o union ordena os dois conjuntos para comparar as linhas

select employee_id, job_id, hire_date, salary -- Conjunto 1
from   rodrigo_rodrigues.employees
where  department_id in (60, 90, 100)
union
select employee_id, job_id, hire_date, salary -- Conjunto 2
from   rodrigo_rodrigues.employees
where  job_id = 'IT_PROG'
order by employee_id;

-- Utilizando o operador Union
  -- Não elimina as duplicidades

select employee_id, job_id, hire_date, salary -- Conjunto 1
from   rodrigo_rodrigues.employees
where  job_id = 'IT_PROG'
union all
select employee_id, job_id, hire_date, salary -- Conjunto 2
from   rodrigo_rodrigues.employees
where  department_id = 60
order by employee_id;

-- Operador Intersect
 -- Intersecção entre os conjuntos ( linhas comuns )
 -- Todas colunas/expressões do conjunto A são iguais a todas colunas/expressões do conjunto B

select employee_id, job_id
from rodrigo_rodrigues.employees
where job_id = 'IT_PROG'
intersect
select employee_id, job_id
from rodrigo_rodrigues.employees
where department_id in (60, 90, 100)
order by employee_id;

-- Operador Minus
  -- Linhas do primeiro conjunto que não estão no segundo conjunto

select employee_id, job_id -- Conjunto 1
from rodrigo_rodrigues.employees
where department_id in (60, 90, 100)
minus
select employee_id, job_id --  Conjunto 2
from rodrigo_rodrigues.employees
where job_id = 'IT_PROG'
order by employee_id;

-- Utilizando mais de um operador SET

select employee_id, job_id, hire_date, salary
from employees
where department_id in (60, 90, 100)
union
(select employee_id, job_id, hire_date, salary
from employees
where job_id = 'it_prog'
intersect
select employee_id, job_id, hire_date, salary
from employees
where salary > 10000)
order by employee_id;