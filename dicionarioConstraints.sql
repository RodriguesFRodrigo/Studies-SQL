select co.constraint_name,
               co.constraint_type,
               co.search_condition,
               co.r_constraint_name,
               co.delete_rule,
               cc.column_name,
               cc.position,
               co.status
from   user_constraints co
   join user_cons_columns cc on (co.constraint_name = cc.constraint_name) and 
                                (co.table_name = cc.table_name)

 --  Altere o nome da tabela
 where  co.table_name = 'PROJECTS'
 order by co.constraint_name,
          cc.position;