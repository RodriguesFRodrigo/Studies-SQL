-- Utilizando Alias de Tabela

select 
  e.employee_id, 
  e.last_name, 
  e.department_id, 
  d.department_name
from rodrigo_rodrigues.employees e 
  -- Empregados com departamentos
  inner join rodrigo_rodrigues.departments d
    on (e.department_id = d.department_id);