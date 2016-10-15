CREATE DATABASE O11R2
   MAXLOGFILES 16
   MAXLOGMEMBERS 4
   MAXDATAFILES 1024
   MAXINSTANCES 1
   MAXLOGHISTORY 680
   CHARACTER SET AL32UTF8
DATAFILE
'/ora01/dbfile/O11R2/system01.dbf'
   SIZE 500M REUSE
   EXTENT MANAGEMENT LOCAL
UNDO TABLESPACE undotbs1 DATAFILE
'/ora02/dbfile/O11R2/undotbs01.dbf'
   SIZE 800M
SYSAUX DATAFILE
'/ora03/dbfile/O11R2/sysaux01.dbf'
   SIZE 500M
DEFAULT TEMPORARY TABLESPACE TEMP TEMPFILE
'/ora02/dbfile/O11R2/temp01.dbf'
   SIZE 500M
DEFAULT TABLESPACE USERS DATAFILE
'/ora01/dbfile/O11R2/users01.dbf'
   SIZE 50M
LOGFILE GROUP 1
        ('/ora01/oraredo/O11R2/redo01a.rdo',
         '/ora02/oraredo/O11R2/redo01b.rdo') SIZE 200M,
        GROUP 2
        ('/ora01/oraredo/O11R2/redo02a.rdo',
         '/ora02/oraredo/O11R2/redo02b.rdo') SIZE 200M,
        GROUP 3
        ('/ora01/oraredo/O11R2/redo03a.rdo',
         '/ora02/oraredo/O11R2/redo03b.rdo') SIZE 200M
USER sys    IDENTIFIED BY topfoo
USER system IDENTIFIED BY topsecrectfoo;
