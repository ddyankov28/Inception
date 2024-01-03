#!/bin/bash

if [ ! -f "/var/www/html/wp-config.php" ]; then

	chown -R www-data:www-data /var/www/html/
	cd /var/www/html

	wp core download --allow-root

	until mysqladmin --user=${MYSQL_USER} --password=${MYSQL_PASS} --host=mariadb ping; do
		sleep 2
	done

	wp config create	--dbname=${MYSQL_DB} \
						--dbuser=${MYSQL_USER} \
						--dbpass=${MYSQL_PASS} \
						--dbhost=mariadb \
						--allow-root

	wp core install		--url=ddyankov.42.fr \
						--title=${WP_TITLE} \
						--admin_user=${WP_ADMIN} \
						--admin_password=${WP_ADMIN_PASS} \
						--admin_email=${WP_ADMIN_MAIL} \
						--allow-root

	wp user create 		${WP_USER} ${WP_USER_MAIL} \
						--user_pass=${WP_USER_PASS} \
						--role=author \
						--allow-root

	wp theme install "business-card-resume" --activate --allow-root

	wp post create --post_author=2 --post_name="first_post" --post_status=publish --post_content="<img src='https://unctad.org/sites/default/files/inline-images/about-evaluation_600x424.jpg' alt='HEY I JUST WANTED TO THANK YOU FOR EVALUATING ME' />" --post_title="WELCOME TO MY FIRST POST !" --allow-root
	
	wp post create --post_author=2 --post_name="second_post" --post_status=publish --post_content="" --post_title="THIS IS THE SECOND POST !" --allow-root
	
	wp media import /tmp/deyan.jpeg --post_id=4 --featured_image --allow-root
	
	wp media import /tmp/softuni.jpeg --post_id=5 --featured_image --allow-root

fi;

exec "$@"
