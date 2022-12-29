----- Manipulação de dados avançados -----

----- Utilizando a opção default nos comandos INSERT ou UPDATE -----

drop table rodrigo_rodrigues.projects;

create table rodrigo_rodrigues.projects
(project_id number(6) not null,
 project_code varchar2(10) not null,
 project_name varchar2(100) not null,
 creation_date date default sysdate not null,
 start_date date,
 end_date date,
 status varchar2(20) not null,
 priority varchar2(10) not null,
 budget number(11,2) not null,
 description varchar2(400) not null);

-- Default traz o resultado da função sysdate
insert into rodrigo_rodrigues.projects (project_id, project_code, project_name, creation_date, status, priority, budget, description)
values (1, 'PROJERP001', 'Oracle ERP', default, 'PLANNING', 'HIGH', 1000000, 'Implantação do Oracle ERP');