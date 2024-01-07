## Introduction

This project is designed to enhance your understanding of system administration through the practical use of Docker. The objective is to virtualize various Docker images within a personal virtual machine.

## General Guidelines

- The project is to be executed on a Virtual Machine.
- Configuration files should be placed in the `srcs` folder.
- A `Makefile` is required at the root directory to set up the entire application, including building Docker images using `docker-compose.yml`.
- Extensive documentation reading on Docker usage and related topics is recommended for successful completion.

## Mandatory Part

The project involves setting up a small infrastructure with different services under specific rules:

- All Docker images must have names corresponding to their respective services.
- Each service should run in a dedicated container.
- Containers must be built from either the penultimate stable version of Alpine or Debian for performance reasons. (I used debian:bullseye)
- Dockerfiles must be created for each service, and these files must be called in the `docker-compose.yml` through the `Makefile`.
- The project requires setting up containers for NGINX with TLSv1.2 or TLSv1.3, WordPress + php-fpm, MariaDB, and two volumes for WordPress database and website files.
- A Docker network must establish connections between containers, and containers must restart in case of a crash.

## Inception

- Use of `network: host` or `--link` is forbidden.
- Containers must not be started with a command running an infinite loop or any hacky patches.
- Configure a domain name (`login.42.fr`) to point to the local IP address.
- Prohibited the use of the `latest` tag.
- No passwords should be present in Dockerfiles; instead, environment variables are mandatory.
- Use a `.env` file at the root of the `srcs` directory to store environment variables.

## Security and Best Practices

- Save credentials, API keys, and environment variables locally in a `.env` file, ignoring it in Git for security reasons.

Feel free to reach out if you encounter any issues or need further clarification. Good luck with your project!
