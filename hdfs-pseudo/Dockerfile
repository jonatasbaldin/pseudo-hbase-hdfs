FROM ubuntu:16.04
MAINTAINER Jonatas Baldin jonatas.baldin@gmail.com

RUN apt-get update && \
    apt-get install wget default-jdk-headless ssh rsync -y

RUN wget http://apache.uniminuto.edu/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz && \
    tar xfz hadoop-2.9.0.tar.gz && \
    rm -rf hadoop-2.9.0.tar.gz && \
    mv hadoop-2.9.0 /opt/hadoop

# Hadoop controls its deamons through passwordless SSH
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

ADD core-site.xml /opt/hadoop/etc/hadoop/
ADD hdfs-site.xml /opt/hadoop/etc/hadoop/
RUN sed -i 's@^export JAVA_HOME.*@export JAVA_HOME=/usr/@' /opt/hadoop/etc/hadoop/hadoop-env.sh

ADD run-hdfs.sh /
RUN chmod +x /run-hdfs.sh

ENV JAVA_HOME /usr

# HDFS
EXPOSE 9000

# NameNode Web interface
EXPOSE 50070

CMD ["/run-hdfs.sh"]
