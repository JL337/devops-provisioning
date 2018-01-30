#!/bin/bash

#Install mongod ver 3.2.18

#Get MongoDB public key for authenticity
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
#Update the source list
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org=3.2.18 mongodb-org-server=3.2.18 mongodb-org-shell=3.2.18 mongodb-org-mongos=3.2.18 mongodb-org-tools=3.2.18

#Start service
sudo service mongod start

#Enable service
sudo systemctl enable mongod

#Delete the old config
sudo rm /etc/mongod.conf

#Move the new config file to the
sudo cp /home/ubuntu/db/mongod.conf /etc/mongod.conf

#Restart service
sudo service mongod restart   

# #Edit the mogod.conf file to have ip 0.0.0.0
# sudo sed -i.bak 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf
# sudo service mongod restart
