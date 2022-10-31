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
)