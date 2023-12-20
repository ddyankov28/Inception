f [ ! -f "/var/www/html/wp-config.php" ]; then

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
						--title=Inception \
						--admin_user=${WP_ADMIN} \
						--admin_password=${WP_ADMIN_PASS} \
						--admin_email=${WP_ADMIN_MAIL} \
						--skip-email \
						--allow-root

	wp user create 		${WP_USER} ${WP_USER_MAIL} \
						--user_pass=${WP_USER_PASS} \
						--role=author \
						--allow-root

	wp theme install "twentytwentyfour" --activate --allow-root

	wp post generate --count=1 --post_author="${WP_USER}" --post_title="WELCOME TO WESTWORLD" --allow-root

fi;

exec "$@"