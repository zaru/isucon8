#!/bin/bash

cd /home/centos/isucon8-qualify/webapp/isucon8
git pull origin master
ps aux | grep puma | grep -v grep | awk '{ print "kill -9", $2 }' | sh
bash ./run_local.sh