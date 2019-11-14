# fluent-plugin-mssql-lookup

[Fluentd](https://fluentd.org/) filter plugin that resolves additional fields via a database lookup

In order to communicate with the SQL Server database, we use [FreeTDS](https://www.freetds.org/)
Consequently this will need to be installed in order to use the plugin.  This repository also contains Dockerfile based on the standard Kubernetes one provided [here](https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/fluentd-elasticsearch/fluentd-es-image).  This build adds the FreeTDS to that standard image.

A prebuilt version of this Docker image is available at http://quay.io/datasoft-computing/fluentd

## Requirements

| fluent-plugin-mssql-lookup | fluentd         | ruby   |
| -------------------------- | --------------- | ------ |
| 1.x.x                      | >= 0.14.0, < 2  | >= 2.1 |

## Installation

### RubyGems

```
$ gem install fluent-plugin-mssql-lookup
```

### Bundler

Add following line to your Gemfile:

```ruby
gem "fluent-plugin-mssql-lookup"
```

And then execute:

```
$ bundle
```

## Config parameters

### db_user

The user name to use to connect to the database

```
db_user myuser
```

### db_password

The password to use to connect to the database

```
db_password mypassword
```

### db_host

The database server host name or ip address
```
db_host mydbserver
```

### db_name

The name of the database to connect to
```
db_name mydb
```

### db_port

The database port to connect to (default 1433)
```
db_port 1433
```

### lookup_sql

The SQL to execute to populate the lookup list
```
lookup_sql "SELECT ID, Field1, Field2 FROM mytable"
```

### lookup_key

The field within the lookup list that will be used to join to the event key field
```
lookup_key ID
```

### lookup_interval

The recurring interval (in seconds) at which to refresh the lookup list (default 600)
```
lookup_interval 1200
```

### key

The key field in the event
```
key id
```


## Copyright

* Copyright(c) 2019 Datasoft Computing Ltd
* License
  * Apache License, Version 2.0
