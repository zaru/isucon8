#!/bin/bash

# ログを綺麗にしておく
echo "" > /var/log/nginx/access.log
echo "" > /var/log/nginx/error.log
echo "" > /var/log/mysql/mysql-slow.sql

# アプリケーションを最新にして再起動する
cd /home/centos/isucon8-qualify/webapp/isucon8
git pull origin master
ps aux | grep puma | grep -v grep | awk '{ print "kill -9", $2 }' | sh
bash ./run_local.sh