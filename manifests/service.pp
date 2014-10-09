# Class: foundationdb::service 
#
# This class manages the FoundationDB service.
#
# The FoundationDB monitor watches it's own config file,
# so it's not necessary (nor wanted) to restart the FDB
# process on config file change.
#

class foundationdb::service(
  $service_ensure       = $foundationdb::service_ensure,
) {

  service { 'foundationdb':
    ensure     => $service_ensure,
  }

}
