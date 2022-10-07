-- AVG e SUM
-- Agrupa a média dos salários e a soma dos salários
select 
  avg(salary),
  sum(salary)
from rodrigo_rodrigues.employees;

-- MIM e MAX

-- Agrupa a menor data de admissão e a maior data de admissão
select
  min(hire_date),
  max(hire_date)
from rodrigo_rodrigues.employees;

-- Agrupa o maior salário e o menor salário
select
  min(salary),
  max(salary)
from rodrigo_rodrigues.employees;

-- COUNT

-- Considera valores nulos
select
  count(*)
from rodrigo_rodrigues.employees;

-- Não considera valores nulos
select 
  count(commission_pct)
from rodrigo_rodrigues.employees;

-- Sem a clausura distinct, considera os valores repetiods
select
  count(department_id)
from rodrigo_rodrigues.employees;

-- Com a clausura distinct, considera somente valores exclusivos
select
  count(distinct department_id)
from rodrigo_rodrigues.employees;

-- Funções de grupos e valores nulos
-- Retorna um valor distorcido, pois não considerou os empregados com valores nulos
select 
  avg(commission_pct)
from rodrigo_rodrigues.employees;

-- Retorna a média real, pois para os empregados nulos, contabilizou com o valor 0
select 
  avg(nvl(commission_pct,0))
from rodrigo_rodrigues.employees;
