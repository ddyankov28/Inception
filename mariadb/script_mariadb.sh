# starting the database server
/usr/bin/mysqld_safe --datadir=/var/lib/mysql &

# waiting for the server to be available
until mysqladmin ping 2> /dev/null; do
    sleep 2
done

# setting up the mariadb with the heredoc
mysql -u root << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DB};
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';
GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

# shutdown the server so that it can be restarted again
killall mysqld 2> /dev/null

# relaunch the database server
exec "$@"