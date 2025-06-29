#!/bin/bash


useradd -d /var/www/html -s /usr/sbin/nologin ftpuser && echo "ftpuser:${FTP_PASSWORD}" | chpasswd
chown -R ftpuser:ftpuser /var/www/html

sed -i 's/listen=NO/listen=YES/' /etc/vsftpd.conf

echo "" >> /etc/vsftpd.conf
echo "local_root=/var/www/html" >> /etc/vsftpd.conf

/usr/sbin/vsftpd /etc/vsftpd.conf
