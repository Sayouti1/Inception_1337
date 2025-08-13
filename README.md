# Inception_1337
# Inception

42 School project implementing a multi-service web infrastructure using Docker containers.

## Overview

This project sets up a complete web stack using Docker Compose with the following services:
- **NGINX**: Web server with TLS
- **WordPress**: Content management system with PHP-FPM
- **MariaDB**: Database server

### Bonus Services
- **Adminer**: Database management interface
- **Redis**: Caching service
- **Redis Commander**: Redis management interface
- **FTP Server**: File transfer service
- **Static Website**: Additional static site

## Structure

```
inception/
├── Makefile                    # Build and management commands
├── srcs/
│   ├── docker-compose.yml      # Main orchestration file
│   └── requirements/
│       ├── nginx/              # NGINX reverse proxy
│       ├── wordpress/          # WordPress + PHP-FPM
│       ├── mariadb/            # MariaDB database
│       └── bonus/              # Additional services
│           ├── adminer/
│           ├── ftp/
│           ├── redis/
│           ├── redis_commander/
│           └── static_website/
```

## Setup

1. **Copy environment file**:
   ```bash
   cp .env_example .env
   ```
   Edit `.env` with your configuration values.

2. **Create volume directories**:
   ```bash
   mkdir -p wordpress mysql
   ```
   Update the volume paths in `docker-compose.yml` from `/home/aes-sayo/data/wordpress` to your local paths.

2. **Build and start services**:
   ```bash
   make start
   ```

3. **Stop services**:
   ```bash
   make stop
   ```


## Requirements

- Docker
- Docker Compose
- Make

## Configuration

All services are configured through:
- Custom Dockerfiles (no pre-built images except Alpine/Debian)
- Environment variables in `.env`
- Configuration files in `conf/` directories
- Initialization scripts in `tools/` directories

## Network

Services communicate through a custom Docker network with:
- NGINX on port 443 (HTTPS only)
- Internal service communication
- Persistent volumes for data storage

## Volumes

- WordPress files
- MariaDB data
- NGINX logs and configurations

---

**Note**: Make sure to configure your `.env` file before running the project.