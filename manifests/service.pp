class foundationdb::service(
  $service_ensure       = $foundationdb::service_ensure,
) {

  service { 'foundationdb':
    ensure     => $service_ensure,
  }

}
