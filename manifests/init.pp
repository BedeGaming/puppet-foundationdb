# Class: foundationdb
#
# Puppet module to install and manage FoundationDB
#
# Sample Usage:
#
# node example {
#   include foundationdb 
# }
class foundationdb (
  $fdb_config_path      = $foundationdb::params::fdb_config_path,
  $fdb_config_file      = $foundationdb::params::fdb_config_file,
  $make_public          = $foundationdb::params::make_public,
  $make_public_script   = $foundationdb::params::make_public_script,
  $fdbuser              = $foundationdb::params::fdbuser,
  $fdbgroup             = $foundationdb::params::fdbgroup,
  $restart_delay        = $foundationdb::params::restart_delay,
  $cluster_file         = $foundationdb::params::cluster_file,
  $fdb_command          = $foundationdb::params::fdb_command,
  $public_address       = $foundationdb::params::public_address,
  $listen_address       = $foundationdb::params::listen_address,
  $data_dir             = $foundationdb::params::data_dir,
  $log_dir              = $foundationdb::params::log_dir,
  $log_size             = $foundationdb::params::log_size,
  $max_logs_size        = $foundationdb::params::max_logs_size,
  $machine_id           = $foundationdb::params::machine_id,
  $datacenter_id        = $foundationdb::params::datacenter_id,
  $fdbclass             = $foundationdb::params::fdbclass,
  $fdbmemory            = $foundationdb::params::fdbmemory,
  $storage_memory       = $foundationdb::params::storage_memory,
  $num_fdb_processes    = $foundationdb::params::num_fdb_processes,
  $backup_agent         = $foundationdb::params::backup_agent,
  $num_backup_agents    = $foundationdb::params::num_backup_agents,
  $package_ensure       = $foundationdb::params::package_ensure,
  $package_name         = $foundationdb::params::package_name,
  $package_source       = $foundationdb::params::package_source,
  $manage_repo          = $foundationdb::params::manage_repo,
  $service_ensure       = $foundationdb::params::service_ensure,
) inherits foundationdb::params {

  contain foundationdb::package
  contain foundationdb::config
  contain foundationdb::service

  if $make_public {
    contain foundationdb::public
  }

  Class['foundationdb::package']->
  Class['foundationdb::config']~>
  Class['foundationdb::service']

}
