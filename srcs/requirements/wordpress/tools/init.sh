#!/bin/bash

if [ ! -f "/var/www/html/wp-load.php" ]; then
  echo "Downloading WordPress core..."
  wp core download --path="/var/www/html" --allow-root
fi

if [ ! -f "/var/www/html/wp-config.php" ]; then
  echo "Creating wp-config.php..."
  wp config create \
    --dbname="${MYSQL_DATABASE}" \
    --dbuser="${MYSQL_USER}" \
    --dbpass="${MYSQL_USER_PASSWORD}" \
    --dbhost="${WP_DATABASE_HOST}" \
    --path="/var/www/html" \
    --allow-root
fi

echo "Checking if WordPress is installed..."
if ! wp core is-installed --path="/var/www/html" --allow-root; then
  echo "Installing WordPress..."
  wp core install \
    --url="${WP_URL}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_ADMIN}" \
    --admin_password="${WP_ADMIN_PASSWORD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --skip-email \
    --path="/var/www/html" \
    --allow-root
fi

echo "WordPress init done."

php-fpm7.4 -F
