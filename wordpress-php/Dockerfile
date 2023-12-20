# using the penultimate stable version of debian
FROM debian:bullseye

# update and upgrade the packages
RUN apt-get update -y && apt-get upgrade -y

# install curl and mdb client
RUN apt-get install -y curl mariadb-client

# install specifeid for wordpress php packages and extensions
RUN apt-get install -y php8.2 php8.2-fpm php8.2-curl php8.2-mysql \
    php8.2-mbstring php8.2-xml php8.2-zip php8.2-gd php8.2-imap

# create directories
RUN mkdir -p /run/php /var/www/html

# change ownership to the www-data user 
RUN chown -R www-data:www-data /var/www/html

# download WP-client
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# make it exec and move it
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# copy conf to the container
COPY ./www.conf /etc/php/8.2/fpm/pool.d/www.conf

# copy the script to the container
COPY ./script_wordpress.sh /tmp/

# make it executable
RUN chmod +x /tmp/script_wordpress.sh

# specifies the command that is going to be run after container runs
ENTRYPOINT [ "/tmp/script_wordpress.sh" ]

#  the command will be launch after the script // stay in foreground //
CMD ["php-fpm8.2", "-F"]
