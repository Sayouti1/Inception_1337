FROM debian:bullseye

RUN apt update && apt install -y vsftpd

RUN mkdir -p /var/www/html

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/init.sh /init.sh
RUN chmod +x /init.sh

CMD ["/init.sh"]
