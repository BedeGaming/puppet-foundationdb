#FoundationDB

##Overview
Puppet module to manage FoundationDB [FoundationDB](https://foundationdb.com/)

##Author
* Rob Rankin <github@undertow.ca>

## To Do
* Tests
* Cluster Membership

## Requirements

### Operating System
This module currently requires RedHat/CentOS.  Pull requests to extend it for other OS's gratefully accepted.

### FoundationDB Packages
This requires that you have the FoundationDB packages in a repo.  Hopefully FoundationDB themselves will provide this at some point in the future.  Until such time, download the FDB packages (client and server) and place them in your own, private repository.  Do not host these packages publicly, respect the FoundationDB license agreement.

You can either edit the params.pp and set `$package_source` to the repositoy URL, set it manually in your manifests somewhere, or better use Hiera and create a Profile for FoundationDb that will inject your custom repository source.

## Install FoundationDB

### Base FoundationDB install
```
class { 'foundationdb': }
  package_source    => $package_source
}
```

### Set number of Backup agents per node

```
class { 'foundationdb':
  num_backup_agents    => 6,
}
```

### Puppet Profile using Hiera for FoundationDB

```
class profile::foundationdb {

  $package_source   = hiera('foundationdb::package_source')

  class { '::foundationdb':
    package_source  => $package_source
  }
}
```
