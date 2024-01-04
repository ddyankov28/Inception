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

	wp theme install "bravada" --activate --allow-root

	wp post delete 1 --force --allow-root
	
	wp post delete 2 --force --allow-root
	
	wp post create --post_author=2 --post_type=page --post_title='Car in the desert' --post_name="desert_car" --post_status=publish --post_content="<p>This is just an example page post with a car</p><img src='https://th.bing.com/th/id/OIG.JVG9Y3iI1cIhBjEFH91v?pid=ImgGn' />" --allow-root
	
	wp post create --post_author=2 --post_type=page --post_title='Bulgarian stallion' --post_name="bg_stallion" --post_status=publish --post_content="This is example only with text" --allow-root
	
	wp post create --post_author=2 --post_name="first_post" --post_status=publish --post_content="<p>Hello, if you are reading this it means that you are my evaluator. Nice to see you here</p><img src='https://unctad.org/sites/default/files/inline-images/about-evaluation_600x424.jpg' alt='Alt Text' />" --post_title="MY FIRST POST" --allow-root
	
	wp post create --post_author=2 --post_name="second_post" --post_status=publish --post_content="<p>Hey there, i hope you like my wordpress</p><img src='https://image.spreadshirtmedia.net/image-server/v1/mp/products/T1459A839PA4459PT28D198581941W10000H6074/views/1,width=1200,height=630,appearanceId=839,backgroundColor=F2F2F2/42-zahl-nummer-sticker.jpg' alt='Alt Text' />" --post_title="THIS IS THE SECOND POST !" --allow-root
	
	wp media import /tmp/dd.jpeg --post_id=6 --featured_image --allow-root
	
	wp media import /tmp/dd1.jpeg --post_id=7 --featured_image --allow-root
	
	wp media import /tmp/impala.jpeg --post_id=4 --featured_image --allow-root
	
	wp media import /tmp/kon.jpeg --post_id=5 --featured_image --allow-root
	
	wp term update category 1 --name=News --allow-root

fi;

exec "$@"
