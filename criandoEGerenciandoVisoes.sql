-- Representação lógica de um select baseado em uma ou mais tabelas e uma ou mais visões.

-- Armazena a view vemployeesdept60 no dicionário de views
create or replace view vemployeesdept60
as select employee_id, first_name, last_name, department_id, salary, commission_pct
from rodrigo_rodrigues.employees
where department_id = 60;

-- Consulta a view no dicionário e executa o select
select * from vemployeesdept60;

-- Vantanges
    -- Restringir dados
        -- Exemplo: criar uma view referente a uma tabela, retirando do select a  coluna salário. Dá ao usuário a permissão a view e não a tabela.
    -- Tornar simples consultas complexas (reutilizar views)
    -- Representar visões diferentes de dados
        -- Exemplo: uma tabela contém pessoas fisícas e jurídicas. Criar uma view para pessoas físicas e outra para pessoas jurídicas
    
-- Criando uma visão complexa
    -- Usa uma ou mais tabelas
    -- Contém funções
    -- Contém grupos de dados
    -- **Talvez permita comandos DML (Depende do comando DML e das regras que são permitidas)**
create or replace view vdepartments_total
(department_id, department_name, minsal, maxsal, avgsal)
as select e.department_id, 
          d.department_name, 
          min(e.salary),
          max(e.salary),
          avg(e.salary)
from rodrigo_rodrigues.employees e 
  join rodrigo_rodrigues.departments d
on (e.department_id = d.department_id)
group by e.department_id, department_name;

-- Só permite operações leitura
create or replace view vemployeesdept20
as select employee_id, first_name, last_name, department_id, salary
from employees
where department_id = 20
with read only;

-- Deletar view
  -- Não acontece nada com as tabelas referencias pela view
drop view vemployeesdept20;
