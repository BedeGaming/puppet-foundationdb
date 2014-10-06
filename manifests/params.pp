class foundationdb::params {

  $fdbuser              = 'foundationdb'
  $fdbgroup             = 'foundationdb'

  $restart_delay        = 60
  $cluster_file         = '/etc/foundationdb/fdb.cluster'

  $fdb_command          = '/usr/sbin/fdbserver'
  $public_address       = 'auto:$ID'
  $listen_address       = 'public'
  $data_dir             = '/var/lib/foundationdb/data/$ID'
  $log_dir              = '/var/log/foundationdb'

  $log_size             = undef
  $max_logs_size        = undef
  $machine_id           = undef
  $datacenter_id        = undef
  $fdbclass             = undef
  $memory               = undef
  $storage_memory       = undef

  $num_fdb_processes    = 1

  $backup_agent         = '/usr/lib/foundationdb/backup_agent/backup_agent'
  $num_backup_agents    = 1

  $package_ensure       = 'latest'
  $package_name         = 'foundationdb'
  $package_source       = undef
  $manage_repo          = true

  $fdb_config_path      = '/etc/foundationdb'
  $fdb_config_file      = 'foundationdb.conf'

}
