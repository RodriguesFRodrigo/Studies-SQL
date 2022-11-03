-- Utilizando o comando UPDATE

-- Update utilizado equivocadamente
update rodrigo_rodrigues.employees set salary = salary * 1.2;
-- Desfaz a transação
rollback;

-- /--------------------/

-- Update utilizado corretamente com a clausura where
update rodrigo_rodrigues.employees set salary = salary * 1.2
where last_name = 'King';

commit;

-- /--------------------/

-- Utilizando Update com Insert

update rodrigo_rodrigues.employees
set job_id = (select job_id -- Single row
              from rodrigo_rodrigues.employees
              where employee_id = 141),
    salary = (select salary -- Single row
              from rodrigo_rodrigues.employees
              where employee_id = 141)
where employee_id = 140;

commit;

-- /--------------------/
