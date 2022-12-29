----- Extract -----

-- Permite extrair padrões de uma data
select extract(day from date '2003-08-22') from dual;
select extract(month from date '2003-08-22') from dual;
select extract(year from date '2003-08-22') from dual;
