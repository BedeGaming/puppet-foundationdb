class foundationdb::package(
  $package_name   = 'foundationdb',
  $package_source = 'foundationdb',
  $package_ensure = 'present',
  $manage_repo    = true,
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
