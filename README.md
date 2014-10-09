#FoundationDB

##Overview
Puppet module to manage [FoundationDB](https://foundationdb.com/)

##Author
* Rob Rankin <github@undertow.ca>

## To Do
* [Tests](https://github.com/BedeGaming/puppet-foundationdb/issues/5)
* [Cluster Membership](https://github.com/BedeGaming/puppet-foundationdb/issues/6)

## Requirements

### Operating System
This module currently requires RedHat/CentOS.  Pull requests to extend it for other OS's gratefully accepted.

### FoundationDB Packages
This requires that you have the FoundationDB packages in a repo.  Hopefully FoundationDB themselves will provide this at some point in the future.  Until such time, download the FDB packages (client and server) and place them in your own, private repository.  Respect the FoundationDB license agreement; do not host these packages publicly.

You can either edit the params.pp and set `$package_source` to the repositoy URL, set it manually in your manifests somewhere, or better use Hiera and create a Profile for FoundationDb that will inject your custom repository source.

## Module Uses

* Installation of FoundationDB
* Upgrading existing clusters
* Managing general conf file settings
* Setting number of FDB processes running (using defaults only)
* Setting number of backup processes running

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

### Using Hiera for FoundationDB

Hiera data source

```
foundationdb::package_source      : '<Repo for packages>'
```

Using [Automatic Paramater Lookup](https://docs.puppetlabs.com/hiera/1/puppet.html#automatic-parameter-lookup)

```
class { 'foundationdb':
  package_source  => $package_source
}
```
