#!/bin/bash

# Run setup locally
chmod +x *
sudo ./master-setup-step1.sh

# Fix key permissions
sudo chmod 600 ~/.ssh/id_rsa
sudo chmod 600 ~/.ssh/id_rsa.pub

# Copy hadoop files
scp -o "StrictHostKeyChecking no" hadoop-3.2.1.tar.gz hadoop-slave1:/home/ubuntu/
scp -o "StrictHostKeyChecking no" hadoop-3.2.1.tar.gz hadoop-slave2:/home/ubuntu/
scp -o "StrictHostKeyChecking no" hadoop-3.2.1.tar.gz hadoop-slave3:/home/ubuntu/

# Run on slaves
ssh -o "StrictHostKeyChecking no" ubuntu@hadoop-slave1 < slave-setup.sh
ssh -o "StrictHostKeyChecking no" ubuntu@hadoop-slave2 < slave-setup.sh
ssh -o "StrictHostKeyChecking no" ubuntu@hadoop-slave3 < slave-setup.sh

# Configuration on master
sudo ./master-setup-step2.sh

# Configuration on slaves
scp configs/yarn-site.xml hadoop-slave1:/usr/local/hadoop/etc/hadoop/yarn-site.xml
scp configs/yarn-site.xml hadoop-slave2:/usr/local/hadoop/etc/hadoop/yarn-site.xml
scp configs/yarn-site.xml hadoop-slave3:/usr/local/hadoop/etc/hadoop/yarn-site.xml

# Start yarn on master
sudo ./master-setup-step3.sh

# Install anaconda
sudo ./master-setup-step4.sh