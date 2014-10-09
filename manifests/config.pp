# Class: foundationdb::config
#
# This class managed the FoundationDB config file, /etc/foundationdb/foundationdb.conf (RedHat and derivitives)
#

class foundationdb::config (
  $fdbuser              = $foundationdb::fdbuser,
  $fdbgroup             = $foundationdb::fdbgroup,
  $fdb_config_path      = $foundationdb::fdb_config_path,
  $fdb_config_file      = $foundationdb::fdb_config_file,
  $restart_delay        = $foundationdb::restart_delay,
  $cluster_file         = $foundationdb::cluster_file,
  $fdb_command          = $foundationdb::fdb_command,
  $public_address       = $foundationdb::public_address,
  $listen_address       = $foundationdb::listen_address,
  $data_dir             = $foundationdb::data_dir,
  $log_dir              = $foundationdb::log_dir,
  $log_size             = $foundationdb::log_size,
  $max_logs_size        = $foundationdb::max_logs_size,
  $machine_id           = $foundationdb::machine_id,
  $datacenter_id        = $foundationdb::datacenter_id,
  $fdbclass             = $foundationdb::fdbclass,
  $fdbmemory            = $foundationdb::fdbmemory,
  $storage_memory       = $foundationdb::storage_memory,
  $num_fdb_processes    = $foundationdb::num_fdb_processes,
  $backup_agent         = $foundationdb::backup_agent,
  $num_backup_agents    = $foundationdb::num_backup_agents,
  $package_ensure       = $foundationdb::package_ensure,
  $package_name         = $foundationdb::package_name,
  $package_source       = $foundationdb::package_source,
  $manage_repo          = $foundationdb::manage_repo,
) {

  file { "${fdb_config_path}/${fdb_config_file}":
    content => template('foundationdb/foundationdb.conf.erb'),
    owner   => $fdbuser,
    group   => $fdbgroup,
    mode    => '0755',
  }

}
