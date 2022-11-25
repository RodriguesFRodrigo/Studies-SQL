select
  operadora.nome  as "operatorNome",
  usu.codigo as "idUsuario",
  usu.nome as "professional",
  Vale || tipobeneficio.nome as "benefitTypeName",
  to_char(beneficioUsuario.ativacao, 'DD/MM/YYYY') as "activationFormatted",
  to_char(beneficioUsuario.data_cancelamento, 'DD/MM/YYYY') as "cancellationFormatted"
from HsBeneficiosUsuariosAlimentacao beneficioUsuario
  inner join HsBeneficiosOperadoras operadora
    on beneficioUsuario.operadora_id = operadora.id
  inner join HsBeneficiosTipos tipobeneficio
    on beneficioUsuario.tipo_beneficio_id = tipobeneficio.id
  inner join hsusuarios usu
    on usu.codigo = beneficioUsuario.id_usuario
  left join vFuncionarios vf
    on (vf.perfil = usu.codigo)
  left join hsfiliais filial
    on (filial.cd_filial = usu.cd_filial)
  left join HSCentroCusto centroCusto
    on (centroCusto.id = usu.centro_custo)
  left join HSCidades cidade
    on (cidade.codigo = usu.id_regional_cidade)
where 
-- Create a virtual table with columns that value is from v_competence
exists (
  select *
  -- You can pass values from payload here like array, like string with a lot of values ...
  from xmltable('01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12')
  -- Check if the competency is within the benefit period
  where (to_date(to_char(beneficioUsuario.ativacao, 'YYYY-MM'), 'YYYY-MM') <= to_date('2020' || '-' || column_value, 'YYYY-MM'))
    and (beneficioUsuario.data_cancelamento is null or to_date(to_char(beneficioUsuario.data_cancelamento, 'YYYY-MM'), 'YYYY-MM') >= to_date('2020' || '-' || column_value, 'YYYY-MM')) 
);
