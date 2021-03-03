#!/bin/bash

line="
export PDSH_RCMD_TYPE=ssh"

javahome="
JAVA_HOME=export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/"

ipadrMaster="10.10.1.50"
ipadrSlave1="10.10.1.84"
ipadrSlave2="10.10.1.27"
ipadrSlave3="10.10.1.96"

STR=$'PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/local/hadoop/bin:/usr/local/hadoop/sbin"\nJAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"'

# Install dependencies
sudo apt-get update -y
sudo apt install ssh pdsh -y

# Append line
sudo echo $line >> .bashrc

# Install Java
sudo apt install openjdk-8-jdk -y

# Unzip hadoop
tar xzf hadoop-3.2.1.tar.gz

# Change the hadoop-3.2.1 folder name to hadoop.
mv hadoop-3.2.1 hadoop

# Change javahome line
sudo echo $javahome >> ~/hadoop/etc/hadoop/hadoop-env.sh

# Move folder
sudo mv hadoop /usr/local/hadoop

# Write conifg
echo "$STR" | sudo tee /etc/environment > /dev/null

# Configure host file
echo "127.0.0.1 localhost

${ipadrMaster} hadoop-master
${ipadrSlave1} hadoop-slave1
${ipadrSlave2} hadoop-slave2
${ipadrSlave3} hadoop-slave3
" | sudo tee /etc/hosts > /dev/null