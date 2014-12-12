# Class: foundationdb::public
#
# Sets the FDB cluster to Public if required:
# https://foundationdb.com/key-value-store/documentation/building-cluster.html#make-foundationdb-externally-accessible
#

class foundationdb::public (
  $fdbuser              = $foundationdb::fdbuser,
  $fdbgroup             = $foundationdb::fdbgroup,
  $fdb_config_path      = $foundationdb::fdb_config_path,
  $fdb_config_file      = $foundationdb::fdb_config_file,
  $cluster_file         = $foundationdb::cluster_file,
  $make_public          = $foundationdb::make_public,
  $make_public_script   = $foundationdb::make_public_script,
) {

  exec { "${make_public_script}":
    path   => '/bin:/usr/bin:/sbin:/usr/sbin',
    onlyif => "grep '127.0.0.1' ${cluster_file}",
  }

}
