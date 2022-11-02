-- Utilizando o comando INSERT
  -- Colunas informadas
  -- Não necessitar ser na ordem da tabela
insert into rodrigo_rodrigues.departments (
  department_id,
  department_name,
  manager_id,
  location_id
) values (
  280,
  'Project Management',
  103,
  1400
);

-- Utilizando o comanod INSERT sem informar as colunas
  -- Necessitar seguir a ordem da tabela

insert into rodrigo_rodrigues.departments
values (
  300,
  'Bussines Inteligence',
  null,
  null
);

-- Inserindo linhas com valores NULOS
  -- Metodo implicito
  -- Informa o valor null para as respectivas colunas
insert into rodrigo_rodrigues.departments
values (301, 'Inovation Studio', null, null);

  -- Metodo explicito
insert into rodrigo_rodrigues.departments(
  department_name,
  department_id
)
values (
  'Business Inovation',
  300
);

-- Inserindo valores que retornam de funções

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
  SYSDATE, -- Valor retornado de uma função
  'IT_PROG',
  7000,
  NULL, 
  103, 
  60
  );

-- Utilizando variáveis de substituição no insert

-- Encerra todas as transações
commit;