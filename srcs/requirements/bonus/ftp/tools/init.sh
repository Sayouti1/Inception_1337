#!/bin/bash

echo "FTP_USER = $FTP_USER"
echo "FTP_USER_PASSWORD = $FTP_USER_PASSWORD"

mkdir -p /var/run/vsftpd/empty

useradd -d /var/www/html -s /bin/bash ${FTP_USER}
echo "${FTP_USER}:${FTP_USER_PASSWORD}" | chpasswd

chown -R ${FTP_USER}:${FTP_USER} /var/www/html

exec /usr/sbin/vsftpd /etc/vsftpd.conf
