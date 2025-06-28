FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir /etc/nginx/certs && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
        -keyout /etc/nginx/certs/aes-sayo.key \
        -out    /etc/nginx/certs/aes-sayo.crt \
        -subj   "/C=MA/ST=Benguerir/L=Benguerir/O=aes-sayo/CN=localhost"

COPY ./conf/default /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
