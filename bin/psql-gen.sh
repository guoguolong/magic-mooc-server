# 为了正确运行 sequelize-auto，请安装正确版本的pg
# npm install -g pg@6.4.2
# npm install -g pg-hstore
sequelize-auto -o "../app/models/psql" -d moocdb -h localhost -u magicmooc -p 5432 -x magicmooc -e postgres