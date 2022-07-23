#!/bin/ash

cd /var;
tar -zxf /var/wordpress.tar.gz;

cp /var/wp-config.php /var/wordpress/wp-config.php;

echo "DONE";
