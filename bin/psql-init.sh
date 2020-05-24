#!/usr/bin/env bash
export SCRIPT_PATH=$(dirname "$0")
export PROJECT_PATH=$SCRIPT_PATH/..
export PGPASSWORD=magicmooc

psql -h localhost -U magicmooc moocdb<$PROJECT_PATH/sql/psql/structure.sql
psql -h localhost -U magicmooc moocdb<$PROJECT_PATH/sql/psql/data.sql