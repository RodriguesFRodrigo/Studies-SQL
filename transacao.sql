-- Quando uma transação termina?
  -- Quando um Commit ou Rollback for executado?
  -- Um comando DML ou DCL executa um commit automatico.
  -- Quando você encerra a sessão no SQL-Developer ou SQL-Plus
    -- SQL-Developer, quando tem uma transação pendente um alerta é enviado pergutando se você desejar fazer commit ou rollback
    -- SQL-Plus, encerra a sessão e realizar um commit se você utilizar o exit
  -- Crash do sistema, rede, sistema operacional, banco de dados, etc. Sofre um rollback

  -- Utilizando o comando COMMIT

-- Utilizando Savepoint

delete from rodrigo_rodrigues.employees
where employee_id in (207,208);

-- Transação delete encerrada
commit;

insert into rodrigo_rodrigues.employees (
  employee_id, 
  first_name,
  last_name,
  email, 
  phone_number,
  hire_date,
  job_id,
  salary,
  commission_pct,
  manager_id,
  department_id
)
values (
  207,
  'Rock',
  'Balboa',
  'DROCK',
  '525.342.237',
  sysdate,
  'IT_PROG',
  7000,
  null,
  103,
  60
);

savepoint A;

insert into employees (
  employee_id,
  first_name,
  last_name,
  email,
  phone_number,
  hire_date,
  job_id,
  salary,
  commission_pct,
  manager_id,
  department_id
) values (
  208,
  'Vito',
  'Corleone',
  'VCORL',
  '525.342.237',
  TO_DATE('11/02/2020', 'DD/MM/YYYY'),
  'IT_PROG',
  20000,
  null,
  103,
  60
);

-- Desfaz tudo a partir do SAVEPOINT A   
rollback to SAVEPOINT  A;

-- Commit do primeiro insert
commit; 

select * from rodrigo_rodrigues.employees
order by employee_id desc;