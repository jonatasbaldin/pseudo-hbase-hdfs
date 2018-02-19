# Pseudo Distributed HBASE/HDFS

A Docker Compose stack for testing HBASE with HDFS, both configured as pseudo distributed. This is **not** recommended for production.

For more information on Pseudo Distributed, check [this](https://hbase.apache.org/book.html#quickstart_pseudo) for HBASE and [this](https://hadoop.apache.org/docs/stable/hadoop-project-dist/hadoop-common/SingleCluster.html#Pseudo-Distributed_Operation) for HDFS.

# How does it work?
The **hdfs-pseudo** creates a HDFS in a Docker volume and shares the service at port 9000. Meanwhile, **hbase-pseudo** uses the shared HDFS as its storage and exposes its services at a REST and Thrift interfaces.

To get it working, just type:
```bash
$ docker-compose up
```

Oh, there's a Python client! It comes with [happybase](https://happybase.readthedocs.io/en/latest/), a Python library to interact with HBase. To try it out, just type:
```
$ docker-compose run python-client ipython
```

```python
import happybase

# Connect to HBase
connection = happybase.Connection('hbase-pseudo')

# Create a table
connection.create_table(
  'mytable',
  {'cf1': dict()}
)
table = connection.table('mytable')

# Write data
table.put(
  b'row-key',
  {b'cf1:qual1': b'value1'}
)

# Get data
row = table.row(b'row-key')

# Print data
print(row[b'cf1:qual1'])
```
