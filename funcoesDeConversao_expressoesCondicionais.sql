-- Utilizando a Função TO_CHAR com Datas

-- Data -> char: to_char
-- HH24: 0 - 23
select 
  last_name,
  to_char(hire_date, 'DD/MM/YYYY  HH24:MI:SS') DT_ADMISSÂO
from employees;

-- Data -> char: to_char
-- HH24: 0 - 23
select 
  sysdate,
  to_char(sysdate, 'DD/MM/YYYY  HH24:MI:SS') DATA
from  dual;

-- Mês: usa 9 caracteres para exibir o mês (descrito).
-- Meses com menos de 9 caracteres também usarão 9 caracteres.
select 
  last_name, 
  to_char(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISSÂO
from employees;

-- FM: remova os zeros à esquerda e remova os espaços extras.
select 
  last_name, 
  to_char(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISSÂO
from employees;

select 
  last_name,
  to_char(hire_date, 'FMDD/MM/YYYY  HH24:MI:SS') DT_ADMISSÂO
from employees;

--------------------------------------------------------------------------------

-- Utilizando a Função TO_CHAR com Números

-- L: símbolo da moeda definida pelo parâmetro NLS_CURRENCY
select 
  first_name,
  last_name, 
  to_char(salary, 'L99G999G999D99') SALARIO
from employees;

--------------------------------------------------------------------------------

-- Utilizando a função to_number

select 
  to_number('$12000,50')  
from  dual;

--------------------------------------------------------------------------------

-- Utilizando a funçaõ to_date

-- Char -> Date
select to_date('06/02/2020','DD/MM/YYYY') DATA
from  dual;

--------------------------------------------------------------------------------

-- Utilizando a função NVL

select
  nvl(null, 0)
from dual;

SELECT 
  last_name, 
  salary, 
  NVL(commission_pct, 0), 
  salary*12 SALARIO_ANUAL, 
 (salary*12) + (salary*12*NVL(commission_pct, 0)) REMUNERACAO_ANUAL
FROM employees;

--------------------------------------------------------------------------------

-- Utilizando a Função COALESCE

select 
  coalesce(NULL, NULL, 'Expresssão 3'), 
  coalesce(NULL, 'Expressão 2', 'Expresssão 3'),
  coalesce('Expressão 1', 'Expressão 2', 'Expresssão 3')
from dual;

select 
  last_name, 
  employee_id, 
  commission_pct, 
  manager_id, 
  COALESCE(TO_CHAR(commission_pct),TO_CHAR(manager_id), 'Sem percentual de comissão e sem gerente')
FROM employees;

--------------------------------------------------------------------------------

-- Utilizando a função NVL2

select nvl2('Não é NULL', 1, 0) from dual;
select nvl2(null, 1, 0) from dual;

--------------------------------------------------------------------------------

-- Utilizando a função NULLIF

select nullif(1000, 1000) from dual;
select nullif(1000, 2000) from dual;

--------------------------------------------------------------------------------

-- Utilizando a função Case no select

select 
  last_name, 
  job_id, 
  salary,
  case job_id
    when 'IT_PROG'   
      then 1.10*salary
    when 'ST_CLERK' 
      then 1.15*salary
    when 'SA_REP' 
      then 1.20*salary
    else salary 
    end "NOVO SALARIO"
from employees;

--------------------------------------------------------------------------------

-- Utilizando a função Decode

-- 1 -> True
-- 0 -> False
-- -1 -> Undefined
select
  decode(1, 1, 'True',
            0, 'False',
            -1, 'Undefined')
from dual;
