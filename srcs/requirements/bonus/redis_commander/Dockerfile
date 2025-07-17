FROM debian:bullseye

RUN apt update && apt install -y \
    curl \
    gnupg \
    ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g redis-commander@latest

RUN useradd -m -s /bin/bash redisuser

WORKDIR /home/redisuser

USER redisuser

CMD ["redis-commander", "--redis-host", "redis"]
