-- Subconsultas no FROM
  -- Utilizado quando precisamos criar uma tabela temporária que será usada uma única vez

select empregados.employee_id, empregados.first_name, empregados.last_name, empregados.job_id, 
       empregados.salary, round(max_salary_job.max_salary,2) max_salary, empregados.salary - round(max_salary_job.max_salary,2) diferença
from rodrigo_rodrigues.employees empregados
  left join (select e2.job_id, max(e2.salary) max_salary -- View temporária
             from rodrigo_rodrigues.employees e2
             group by e2.job_id) max_salary_job
    on empregados.job_id = max_salary_job.job_id;