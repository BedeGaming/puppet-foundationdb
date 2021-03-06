# Class: foundationdb:package::redhat
#
# Class to manage the Foundationdb packages installation on RedHat systems
#
class foundationdb::package::redhat (
  $client_only    = $foundationdb::package::client_only,
  $manage_repo    = $foundationdb::package::manage_repo,
  $package_ensure = $foundationdb::package::package_ensure,
  $package_name   = $foundationdb::package::package_name,
  $package_source = $foundationdb::package::package_source,
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
    }

    file { '/etc/yum.repos.d/foundationdb-release.repo':
      ensure  => present,
      require => Yumrepo['foundationdb-release'],
    }
  }

  if $client_only {
    package { $package_client:
      ensure  => $package_ensure,
      require => Yumrepo['foundationdb-release']
    }
  } else {
    package { $package_client:
      ensure  => $package_ensure,
      require => Yumrepo['foundationdb-release']
    }->
    package { $package_server:
      ensure  => $package_ensure,
      require => Yumrepo['foundationdb-release']
    }
  }

}
