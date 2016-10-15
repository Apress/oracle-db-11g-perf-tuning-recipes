create tablespace tools
  datafile '/ora01/dbfile/INVREP/tools01.dbf'
  size 100m                                      -- Fixed datafile size
  extent management local               -- Locally managed
  uniform size 128k                           -- Uniform extent size
  segment space management auto -- ASSM
/

create bigfile tablespace tools_bf
  datafile '/ora01/dbfile/O11R2/tools_bf01.dbf'
  size 100m
  extent management local
  uniform size  128k
  segment space management auto
/
