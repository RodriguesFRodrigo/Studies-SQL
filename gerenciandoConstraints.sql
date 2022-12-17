-- Gerenciando Constraints

-- Removendo uma Constraint a uma Tabela
  -- Se for uma restrição pk referenciada por fk em outras tabelas é necessário usar cascade

-- Remove a constraint projects_department_id_fk e sua regra de integridade
alter table rodrigo_rodrigues.projects
drop constraint projects_department_id_fk;

alter table rodrigo_rodrigues.projects
drop constraint projects_project_id_pk cascade;

-- Adicionando uma Constraint a uma Tabela
alter table rodrigo_rodrigues.projects
add constraint projects_department_id_fk foreign key (department_id)
references rodrigo_rodrigues.departments(department_id);

-- Desabilitando uma Constraint
-- Desabilitar para fazer uma ação e habilitar novamente depois
alter table rodrigo_rodrigues.projects
disable constraint projects_department_id_fk;

alter table rodrigo_rodrigues.projects
disable constraint projects_project_id_pk cascade;

-- Enable para ativar uma constraint