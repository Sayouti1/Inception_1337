#!/bin/bash
#set -x
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
    --dbhost="${DATABASE_HOST}" \
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
  
  wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
    --role=author \
    --user_pass="${WP_USER_PASSWORD}" \
    --path="/var/www/html" \
    --allow-root
fi

echo "WordPress init done."

wp theme install twentyseventeen --path="/var/www/html" --activate --allow-root
echo "new theme installed."

wp plugin install redis-cache --path="/var/www/html" --activate --allow-root
echo "redis-cache installed."

wp config set WP_REDIS_HOST redis --path="/var/www/html" --type=constant --allow-root
echo "redis configured done."

wp redis enable --path="/var/www/html"  --allow-root
echo "redis enabled."

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

php-fpm7.4 -F
