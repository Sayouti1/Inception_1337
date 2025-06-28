#!/bin/bash

wp core download --path="/var/www/html" --allow-root

wp config create \
	--dbname="${MYSQL_DATABASE}" \
	--dbuser="${MYSQL_USER}" \
	--dbpass="${MYSQL_USER_PASSWORD}" \
	--dbhost="${WP_DATABASE_HOST}" \
	--path="/var/www/html" \
	--allow-root

echo "config done ... start installing ..."
wp core install \
	--url="${WP_URL}" \
	--title="${WP_TITLE}" \
	--admin_user="${WP_ADMIN}" \
      	--admin_password="${WP_ADMIN_PASSWORD}" \
	--admin_email="${WP_ADMIN_EMAIL}" \
	--skip-email \
	--path="/var/www/html" \
	--allow-root

echo "wordpress init Done ..."

php-fpm7.4 -F


