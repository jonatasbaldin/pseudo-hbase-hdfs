#!/bin/bash

echo "Starting SSHD service..."
service ssh start

# Should be done after starting the server
echo "Adding SSH key to known_hosts..."
ssh-keyscan -H localhost,127.0.0.1,0.0.0.0 >> ~/.ssh/known_hosts

# Formats the volume if there's nothing there
if [ ! -d "/hdfs/dfs" ]; then
    echo "Formating HDFS filesystem..."
    /opt/hadoop/bin/hdfs namenode -format
fi

echo "Starting HDFS service..."
while true; do /opt/hadoop/sbin/start-dfs.sh ; sleep infinity; done
