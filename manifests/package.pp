# Class: foundationdb:package
#
# Class to manage the Foundationdb packages installation.
#
# Requires a (yum) repo somewhere passed in as $package_source.
#
class foundationdb::package(
  $package_ensure       = $foundationdb::package_ensure,
  $package_name         = $foundationdb::package_name,
  $package_source       = $foundationdb::package_source,
  $manage_repo          = $foundationdb::manage_repo,
) {

  case $::osfamily {
    'RedHat': {
      class { 'foundationdb::package::redhat':
        package_source => $package_source,
        manage_repo    => $manage_repo,
        package_ensure => $package_ensure,
        package_name   => $package_name,
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
