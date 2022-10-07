-- Single Row

-- Funções de conversão para maisculas e minusculas

select employee_id, last_name, department_id
from rodrigo_rodrigues.employees
where upper(last_name) = 'KING';

select initcap(job_id)
from rodrigo_rodrigues.employees;

--------------------------------------------------------------------------------

-- Funções de manipulação de caracteres

select concat('The', 'Rock') from dual;
select substr('Adão Negro - The Rock', 1, 4) from dual;
select length('Adão Negro - The Rock') from dual;
-- Posição inicial da substring
select instr('Adão Negro - The Rock', 'The Rock') from dual;
select replace('theRock@localhost.com.us', 'us', 'br') from dual;
select trim('     Adão Negro     ') from dual;
select trim(';' from ';Adão Negro;') from dual;

--------------------------------------------------------------------------------

-- Funções de Números

select round(26.9101112, 2) from dual; -- 0 < 5
select round(26.9171112, 2) from dual; -- 7 > 5
select trunc(26.9101112, 2) from dual;
select trunc(26.9171112, 2) from dual;

-------------------------------------------------------------------------------

-- Funções para manipular Datas

select sysdate from dual;
select sysdate+30 from dual;
select sysdate-30 from dual;
-- Diferença de duas datas em meses
select MONTHS_BETWEEN(to_date('22-11-2022', 'DD-MM-YYYY'), to_date('22-09-2022', 'DD-MM-YYYY')) from dual;
-- Adicionar meses
select ADD_MONTHS(to_date('25-09-2022', 'DD-MM-YYYY'),3) from dual;
-- Próximo dia relativo a data especificada
select NEXT_DAY(to_date('22-09-2022', 'DD-MM-YYYY'), 'SEGUNDA FEIRA') from dual;
select NEXT_DAY(to_date('22-09-2022', 'DD-MM-YYYY'), 'TERÇA FEIRA') from dual;
select NEXT_DAY(to_date('22-09-2022', 'DD-MM-YYYY'), 'QUARTA FEIRA') from dual;
select NEXT_DAY(to_date('22-09-2022', 'DD-MM-YYYY'), 'QUINTA FEIRA') from dual;
select NEXT_DAY(to_date('22-09-2022', 'DD-MM-YYYY'), 'SEXTA FEIRA') from dual;
-- Último dia do mês
select LAST_DAY(to_date('22-09-2022', 'DD-MM-YYYY')) from dual;

-- TRUNC
select trunc(sysdate) from dual;
