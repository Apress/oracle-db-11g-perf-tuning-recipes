select sql_id,sql_text
       from v$sql
       where sql_text='select sum(quantity_sold) from sales';

