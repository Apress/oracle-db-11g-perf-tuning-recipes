select relative_fno, owner, segment_name, segment_type
     from dba_extents
     where file_id = &file
     and &block betgween block_id and block_id + &blocks - 1;

