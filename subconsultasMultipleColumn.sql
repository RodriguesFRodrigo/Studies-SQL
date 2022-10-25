-- Subconsultas multiple column
    -- A subconsulta pode retornar mais de uma coluna
    -- A expressão de comparação deve ter mais de uma coluna
    -- A expressão tem o mesmo de colunas da subconsulta
    -- Comparação aos pares


-- Profissionais com maior salário por cargo
select e1.employee_id, e1.first_name, e1.job_id, e1.salary
from employees e1
-- e1.job_id, e1.salary precisam ser igual a e2.job_id, max(e2.salary)
where (e1.job_id, e1.salary) in (select e2.job_id, max(e2.salary) -- Maior salário de cada cargo
                                 from employees e2
                                 group by e2.job_id);