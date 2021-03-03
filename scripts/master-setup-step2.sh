# Edit core-site.xml
sudo cp configs/core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml

# Edit hdfs-site
sudo cp configs/hdfs-site.xml /usr/local/hadoop/etc/hadoop/hdfs-site.xml

# Add slaves
sudo cp configs/workers /usr/local/hadoop/etc/hadoop/workers

# copy the Hadoop Master configurations
scp /usr/local/hadoop/etc/hadoop/* hadoop-slave1:/usr/local/hadoop/etc/hadoop/
scp /usr/local/hadoop/etc/hadoop/* hadoop-slave2:/usr/local/hadoop/etc/hadoop/
scp /usr/local/hadoop/etc/hadoop/* hadoop-slave3:/usr/local/hadoop/etc/hadoop/

# Format HDFS
source /etc/environment
hdfs namenode -format

# Start HDFS
start-dfs.sh

# Configure YARN
export HADOOP_HOME="/usr/local/hadoop"
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME