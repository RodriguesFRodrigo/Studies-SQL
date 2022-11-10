desc rodrigo_rodrigues.employees;

select * from rodrigo_rodrigues.employees;

select level, employee_id, first_name, last_name, job_id, manager_id
from rodrigo_rodrigues.employees
-- A partir de qual posição começar a navegar na hierarquia
-- is null, a partir do root
start with manager_id is null
-- Especifica se é bottom/up ou up/down
connect by prior employee_id = manager_id;