begin
dbms_stats.delete_column_stats(ownname=>'SH',tabname=>'SALES',
colname=>'PROD_ID',col_stat_type=>'HISTOGRAM');
end;
/

begin
dbms_stats.set_table_prefs('SH','SALES','METHOD_OPT','FOR  ALL COLUMNS SIZE AUTO,
FOR COLUMNS  SIZE 1 PROD_ID');
end;
/

