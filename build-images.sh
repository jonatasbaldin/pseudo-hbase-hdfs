#!/bin/bash

if [ -z "$1" ]; then
    echo "You must inform the Docker image version."
    exit 1
fi

echo "Builiding and pushing hbase-pseudo image..."
docker build ./hbase-pseudo/ -t hbase-pseudo:$1
docker tag hbase-pseudo:$1 jonatasbaldin/hbase-pseudo:$1
docker push jonatasbaldin/hbase-pseudo:$1

echo "Building and pushing hdfs-pseudo image..."
docker build ./hdfs-pseudo/ -t hdfs-pseudo:$1
docker tag hdfs-pseudo:$1 jonatasbaldin/hdfs-pseudo:$1
docker push jonatasbaldin/hdfs-pseudo:$1
