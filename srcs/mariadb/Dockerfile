# using the penultimate stable version of debian
FROM debian:bullseye

# update and upgrade the packages
RUN apt-get update -y && apt-get upgrade -y

# install mariadb
RUN apt-get install -y mariadb-server mariadb-client iputils-ping

# create mysql dir to store runtime info for the server -p(create parent dirs if needed)
RUN mkdir -p /run/mysqld /var/lib/mysql

# give the mysql user and group permission to work with these dirs
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql

# initialize the database
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --skip-test-db

# copy the conf file to the container
COPY ./my.conf /etc/mysql/my.cnf

# copy the script in the container
COPY ./script_mariadb.sh ./tmp/

# make it executable
RUN chmod +x /tmp/script_mariadb.sh

# specifies the command that is going to be run after container runs
ENTRYPOINT [ "/tmp/script_mariadb.sh" ]

# the command will be launch after the script
# safe has some key features that the normal doesnt have
CMD ["mysqld_safe", "--datadir=/var/lib/mysql"]
