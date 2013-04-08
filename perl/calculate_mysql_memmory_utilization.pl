#!/usr/bin/perl
#use strict;
#use warnings;

# Usage : perl thisScript.pl

$K=1024;
$M=$K*$K;

 $num_connections = 20;

 $thread_stack = 64*$K;
 $read_rnd_buffer_size = 2*$M;
 $max_allowed_packet = 1*$M;
 $tmp_table_size = 2*$M;
 # Set low for non-myisam config, but not lower than 4M since temp tables need it, too.
 $myisam_sort_buffer_size=4 *$M;
 $read_buffer_size = 2 *$M;
 $join_buffer_size = 8 *$M;

 $query_cache_size = 128 * $M;
 # Set low for non-myisam config
 $key_buffer_size = 4 * $M;
 $innodb_buffer_pool_size = 64 *$M;
 $innodb_additional_mem_pool_size = 2 *$M;
 $innodb_log_buffer_size = 4 * $M;

 # #=============== CALCULATIONS. DO NOT MODIFY

 $per_thread_ram = $thread_stack
 + $read_rnd_buffer_size
 + $max_allowed_packet
 + $tmp_table_size
 + $myisam_sort_buffer_size
 + $read_buffer_size
 + $join_buffer_size;

 $total_ram = $per_thread_ram * $num_connections
 + $query_cache_size
 + $key_buffer_size
 + $innodb_buffer_pool_size
 + $innodb_additional_mem_pool_size
 + $innodb_log_buffer_size;

 print "Total RAM consumed: ".$total_ram/$M." MB\n";
