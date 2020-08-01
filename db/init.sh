#!/bin/bash

ROOT_DIR=$(cd $(dirname $0)/..; pwd)
DB_DIR="$ROOT_DIR/db"
BENCH_DIR="$ROOT_DIR/bench"

export MYSQL_PWD=isucon

mysql -h $DB_HOST -u$DB_USER -p$DB_PASS -e "DROP DATABASE IF EXISTS torb; CREATE DATABASE torb;"
gzip -dc "$DB_DIR/init.sql.gz" | mysql -h $DB_HOST -u$DB_USER -p$DB_PASS torb
