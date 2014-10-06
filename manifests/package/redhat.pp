class foundationdb::package::redhat (
  $manage_repo    = true,
  $package_ensure = 'present',
  $package_name   = 'foundationdb',
  $package_source = undef,
) {

  $package_client = "${package_name}-clients"
  $package_server = "${package_name}-server"

  if $manage_repo {
    yumrepo { 'foundationdb-release':
      baseurl  => $package_source,
      descr    => 'foundationdb repo',
      enabled  => '1',
      gpgcheck => '0',
      priority => '1',
      before   => [ Package[$package_client], Package[$package_server] ],
    }

    file { '/etc/yum.repos.d/foundationdb-release.repo':
      ensure  => present,
      require => Yumrepo['foundationdb-release'],
    }
  }

  package { $package_client:
    ensure  => $package_ensure,
  }->
  package { $package_server:
    ensure  => $package_ensure,
  }

}
