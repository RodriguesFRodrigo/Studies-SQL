SELECT select_list
FROM table_expression
[ WHERE … ] [ START WITH start_expression ] CONNECT BY [NOCYCLE] { PRIOR child_expr = parent_expr | parent_expr = PRIOR child_expr }
[ ORDER SIBLINGS BY column1 [ ASC | DESC ] [, column2 [ ASC | DESC ] ] …
[ GROUP BY … ] [ HAVING … ]


-- Employee hierarchy (employee-manager relationship)
-- Organizational hierarchy
-- Graph of links between web pages
-- Connected social networking graph
-- A set of tasks in a project
-- File system

desc rodrigo_rodrigues.employees;

select * from rodrigo_rodrigues.employees;

-- Parent manager_id
-- Child: employee_id
select level, employee_id, first_name, last_name, job_id, manager_id
from rodrigo_rodrigues.employees
-- A partir de qual posição começar a navegar na hierarquia
-- is null, a partir do root, manager_id é o pai
start with manager_id is null
-- Especifica se é bottom/up ou up/down
connect by prior employee_id = manager_id;

-- -/--------------------/-

-- Outro exemplo de consulta up/down

select level, employee_id, first_name, last_name, job_id, manager_id
from rodrigo_rodrigues.employees
-- Navega a partir do empregado 103
-- O pai é employee_id
start with employee_id = 103
-- up/down
-- connect by prior employee_id = manager_id;
connect by manager_id = prior employee_id;

-- -/--------------------/-

select level, employee_id, first_name, last_name, job_id, manager_id
from rodrigo_rodrigues.employees
-- Navega a partir do empregado 103
-- O pai é employee_id
start with employee_id = 103
-- bottom u´p
-- connect by prior employee_id = manager_id;
connect by prior manager_id = employee_id;