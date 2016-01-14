select 
    date_format(
        adddate('2011-1-1', @num:=@num+1), 
        '%Y-%m-%d'
    ) date
from 
    any_table,    
    (select @num:=-1) num
limit 
    365
