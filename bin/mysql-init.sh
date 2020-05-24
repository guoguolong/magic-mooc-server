#!/usr/bin/env bash
export SCRIPT_PATH=$(dirname "$0")
export PROJECT_PATH=$SCRIPT_PATH/..

# CREATE DATABASE IF NOT EXISTS moocdb DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

# mysql5
# GRANT ALL ON *.* TO magicmooc@localhost IDENTIFIED BY "magicmooc";

# mysql8
# CREATE USER magicmooc@localhost IDENTIFIED BY 'magicmooc';
# GRANT ALL PRIVILEGES ON *.* TO magicmooc@localhost;
# ALTER user magicmooc@localhost IDENTIFIED WITH mysql_native_password BY 'magicmooc';

export MYSQL_HOST=127.0.0.1
export MYSQL_PORT=3306
export MYSQL_DB=moocdb
export MYSQL_USER=magicmooc
export MYSQL_PASSWORD=magicmooc


mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -P $MYSQL_PORT $MYSQL_DB <$PROJECT_PATH/sql/mysql/structure.sql
mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -P $MYSQL_PORT $MYSQL_DB <$PROJECT_PATH/sql/mysql/data.sql
