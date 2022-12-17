-- Constraints são regras de integridade, uma vez que uma Constraint é definida, ninguém pode violá-la.

-- NOT NULL
-- Não permite valores nulos para uma coluna.
-- A constraint primary key impõe a constraint not null.
create table rodrigo_rodrigues.projects
(project_id    number(6)    not null,
 project_code  varchar2(10) not null,
 project_name  varchar2(100)not null,
 department_id number(4)    not null,
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null);

 -- PRIMARY KEY
 -- Definindo Constraint PRIMARY KEY a nível de Coluna
 -- O melhor idenficador da tabela.
 -- Garante a integridade:
    -- Not Null
    -- Valores únicos
create table rodrigo_rodrigues.projects
(project_id    number(6)    not null
 constraint projects_project_id_pk primary key,
 project_code  varchar2(10) not null,
 project_name  varchar2(100)not null,
 department_id number(4)    not null,
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null);

-- Definindo Constraint PRIMARY KEY a nível de Tabela
create table projects
(project_id    number(6)    not null, 
 project_code  varchar2(10) not null,
 project_name  varchar2(100)not null,
 department_id number(4)    not null,
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null,
 constraint projects_project_id_pk primary key(project_id));

-- Foreign Key
-- Pode referenciar uma coluna unique
-- Identificador da tabela
-- Garante a integridade
    -- Estabele a relação da tabela com outra tabela
create table rodrigo_rodrigues.projects
(project_id    number(6)    not null
 constraint projects_project_id_pk primary key,
 project_code  varchar2(10) not null
 constraint projects_project_code_uk unique,
 project_name  varchar2(100)not null,
 department_id number(4)    not null
 -- department_id é chave estrangeira que referencia a tabela departments na coluna department_id
 -- garante que um projeto esteja em um departamento
 constraint projects_department_id_fk references rodrigo_rodrigues.departments(department_id),
 creation_date date default sysdate not null,
 start_date    date,
 end_date      date,
 status        varchar2(20) not null,
 priority      varchar2(10) not null,
 budget        number(11,2) not null,
 description   varchar2(400)not null);

 -- Regras de delegação
 -- No action: não deleta os registros com  referencia, retorna um erro.
 create table rodrigo_rodrigues.teams
(project_id    number(6)  not null,
 employee_id   number(6)  not null,
 constraint teams_project_id_fk foreign key (project_id)
 references rodrigo_rodrigues.projects(project_id),
 constraint teams_employee_id_fk foreign key (employee_id)
 references rodrigo_rodrigues.employees(employee_id));

-- Regras de delegação
-- On delete cascade: deleta os registros filhos.
 create table teams
(project_id    number(6),
 employee_id   number(6)  not null,
 constraint teams_project_id_fk foreign key (project_id)
 references projects(project_id) on delete set null,
 constraint teams_employee_id_fk foreign key (employee_id)
 references employees(employee_id));