desc rodrigo_rodrigues.employees;

select * from rodrigo_rodrigues.employees;

select level, employee_id, first_name, last_name, job_id, manager_id
from rodrigo_rodrigues.employees
-- A partir de qual posição começar a navegar na hierarquia
-- is null, a partir do root
start with manager_id is null
-- Especifica se é bottom/up ou up/down
connect by prior employee_id = manager_id;

-- -/--------------------/-

-- Outro exemplo de consulta up/down

select level, employee_id, first_name, last_name, job_id, manager_id
from rodrigo_rodrigues.employees
-- Navega a partir do empregado 103
start with employee_id = 103
-- up/down
-- connect by prior employee_id = manager_id;
connect by manager_id = prior employee_id;

-- -/--------------------/-

select level, employee_id, first_name, last_name, job_id, manager_id
from rodrigo_rodrigues.employees
-- Navega a partir do empregado 103
start with employee_id = 103
-- up/down
-- connect by prior employee_id = manager_id;
connect by prior manager_id = employee_id;