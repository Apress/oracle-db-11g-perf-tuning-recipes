BEGIN
  dbms_sqltune.create_stgtab_sqlset(
  table_name => 'STS_TABLE'
 ,schema_name => 'MV_MAINT');
END;
/

BEGIN
  dbms_sqltune.pack_stgtab_sqlset(
  sqlset_name          => 'IO_STS'
 ,sqlset_owner         => 'SYS'
 ,staging_table_name   => 'STS_TABLE'
 ,staging_schema_owner => 'MV_MAINT');
END;
/

BEGIN
DBMS_SQLTUNE.UNPACK_STGTAB_SQLSET(
  sqlset_name        => '%'
 ,replace            => TRUE
 ,staging_table_name => 'STS_TABLE');
END;
/ 




