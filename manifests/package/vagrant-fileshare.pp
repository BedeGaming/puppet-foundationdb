# Class: foundationdb:package::vagrant-fileshare
#
# Class to manage the Foundationdb packages installation on RedHat systems
#
class foundationdb::package::vagrant-fileshare (
  $package_name   = $foundationdb::package::package_name,
  $package_source = $foundationdb::package::package_source,
) {

  $package_client = "${package_name}-clients"
  $package_server = "${package_name}-server"

  file { "foundation_client":
    name =>  "/tmp/foundation_client.deb",
    ensure => file,
    source => "puppet:///files/foundationdb-clients_2.0.10-1_amd64.deb"
  }
  file { "foundation_server":
    name => "/tmp/foundation_server.deb",
    ensure => file,
    source => "puppet:///files/foundationdb-server_2.0.10-1_amd64.deb"
  }

  package { $package_client:
    ensure  => $package_ensure,
    provider => dpkg,
    source =>  "/tmp/foundation_client.deb",
    require => File[foundation_client]
    }-> 
  package { $package_server:
    ensure  => $package_ensure,
    provider => dpkg,
    source => "/tmp/foundation_server.deb",
    require => File[foundation_server]
  }

}
