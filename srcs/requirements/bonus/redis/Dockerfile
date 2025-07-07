FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y lsb-release curl gpg

RUN curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/redis.list

RUN apt update && apt install -y redis

RUN sed -i "s/protected-mode yes/protected-mode no/" /etc/redis/redis.conf
RUN sed -i "s/bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf

CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize", "no"]

