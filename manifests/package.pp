class foundationdb::package(
  $package_ensure       = $foundationdb::package_ensure,
  $package_name         = $foundationdb::package_name,
  $package_source       = $foundationdb::package_source,
  $manage_repo          = $foundationdb::manage_repo,
) {

  anchor { 'foundationdb::package::begin': }
  anchor { 'foundationdb::package::end': }

  case $::osfamily {
    'redhat': {
      class { 'foundationdb::package::redhat':
        package_source => $package_source,
        manage_repo    => $manage_repo,
        package_ensure => $package_ensure,
        package_name   => $package_name,
        require        => Anchor['foundationdb::package::begin'],
        before         => Anchor['foundationdb::package::end'],
      }
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
