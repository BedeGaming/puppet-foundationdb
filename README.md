#FoundationDB

FoundationDB has been purchased by Apple, and is no longer a product.  Apple will be cancelling all support contracts and apprently not continuing to offer FDB for sale.  Therefore this module is of course deprecated and no longer support (at least by me!).

##Overview
Puppet module to manage [FoundationDB](https://foundationdb.com/)

[![Build Status](https://travis-ci.org/BedeGaming/puppet-foundationdb.svg?branch=master)](https://travis-ci.org/BedeGaming/puppet-foundationdb)

##Author
* Rob Rankin <github@undertow.ca>

## To Do
* [Cluster Membership](https://github.com/BedeGaming/puppet-foundationdb/issues/6)

## Requirements

### Operating System
This module currently requires RedHat/CentOS.  Pull requests to extend it for other OS's gratefully accepted.

### FoundationDB Packages
This requires that you have the FoundationDB packages in a repo.  Hopefully FoundationDB themselves will provide this at some point in the future.  Until such time, download the FDB packages (client and server) and place them in your own, private repository.  Respect the FoundationDB license agreement; do not host these packages publicly.

You can either edit the params.pp and set `$package_source` to the repositoy URL, set it manually in your manifests somewhere, or better use Hiera to configure your custom repository source.

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

Hiera examples

```
foundationdb::package_source    : '<Repo for packages>'
foundationdb::fdbuser           : 'foundationdb'
foundationdb::fdbgroup          : 'foundationdb'
foundationdb::restart_delay     : 60
foundationdb::cluster_file      : '/etc/foundationdb/fdb.cluster'
foundationdb::fdb_command       : '/usr/sbin/fdbserver'
foundationdb::public_address    : 'auto:$ID'
foundationdb::listen_address    : 'public'
foundationdb::data_dir          : '/mnt/resource/$ID'
foundationdb::num_fdb_processes : 1
foundationdb::backup_agent      : '/usr/lib/foundationdb/backup_agent/backup_agent'
foundationdb::num_backup_agents : 1
foundationdb::package_name      : 'foundationdb'
foundationdb::make_public       : true
```

