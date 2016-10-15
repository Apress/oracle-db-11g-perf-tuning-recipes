CREATE TABLE EMP_COPY 
PARALLEL(DEGREE 4)
AS
SELECT * FROM EMP;

create table emp_ctas_new2
parallel(degree 4)
nologging
as select /*+ parallel(a,4) */ * from emp_ctas
where empno <= 1000000;
