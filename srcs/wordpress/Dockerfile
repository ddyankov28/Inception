# using the penultimate stable version of debian
FROM debian:bullseye

# update and upgrade the packages
RUN apt-get update -y && apt-get upgrade -y

# install curl and mdb client
RUN apt-get install -y curl mariadb-client

# install specifeid for wordpress php packages and extensions
RUN apt-get install -y php7.4 php7.4-fpm php7.4-curl php7.4-mysql \
    php7.4-mbstring php7.4-xml php7.4-zip php7.4-gd php7.4-imap

# create directories
RUN mkdir -p /run/php /var/www/html

# change ownership to the www-data user 
RUN chown -R www-data:www-data /var/www/html

# download WP-client
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# make it exec and move it
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# copy conf to the container
COPY ./www.conf /etc/php/7.4/fpm/pool.d/www.conf

# copy the script to the container
COPY ./script_wordpress.sh /tmp/

COPY ./dd.jpeg /tmp/

COPY ./dd1.jpeg /tmp/

COPY ./kon.jpeg /tmp/

COPY ./impala.jpeg /tmp/

# make it executable
RUN chmod +x /tmp/script_wordpress.sh

# specifies the command that is going to be run after container runs
ENTRYPOINT [ "/tmp/script_wordpress.sh" ]

#  the command will be launch after the script // stay in foreground //
CMD ["php-fpm7.4", "-F"]
