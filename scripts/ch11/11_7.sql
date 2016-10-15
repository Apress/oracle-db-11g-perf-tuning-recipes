BEGIN
  DBMS_SQLTUNE.CREATE_SQLSET(
  sqlset_name => 'HIGH_IO',
  description => 'High disk read tuning set');
END;
/






