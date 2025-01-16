Sure! Below is a template for your **README.md** file. You can modify the specific parts such as your name, GitHub username, etc., according to your project details.

---

# Inception Project - System Administration with Docker

This project was part of a system administration course aimed at understanding the basic concepts of Docker, Docker Compose, and infrastructure management. The goal was to deploy multiple services, such as **NGINX**, **WordPress**, **MariaDB**, and others, on a personal virtual machine, using Docker and Docker Compose.

## Project Overview

In this project, I set up an infrastructure composed of the following services:

- **NGINX**: A reverse proxy and entry point to the system, configured to use TLSv1.2 or TLSv1.3 encryption.
- **WordPress**: A dynamic website engine running alongside PHP-FPM.
- **MariaDB**: A relational database management system for storing WordPress data.
- **Volumes**: Separate volumes for storing WordPress database and website files.
- **Docker Network**: A private Docker network to facilitate communication between services.
- **Makefile**: Used for automating the build process with `docker-compose.yml`.
  
Additionally, I configured environment variables using a `.env` file and Docker secrets for securely managing credentials.

## Key Features

- **Virtual Machine Setup**: Entire application runs within a virtual machine using Docker.
- **Dockerized Services**: Each service is containerized using custom `Dockerfile`s.
- **Automatic Restart**: Containers are set to restart in case of failure.
- **TLS Configuration**: NGINX is configured to support only TLSv1.2 and TLSv1.3 for secure connections.
- **Custom Domain**: Set up a custom domain (e.g., `wil.42.fr`) that resolves to the local machine's IP.
- **Environment Variables**: Sensitive data like passwords and configuration details are managed using environment variables.
  
### Dockerized Services

- **NGINX**: Serves as the reverse proxy for the entire application, handling HTTPS traffic.
- **WordPress**: WordPress installation with PHP-FPM configured. The WordPress container does not use NGINX directly.
- **MariaDB**: A separate container running MariaDB for the WordPress database.
- **Volumes**:
  - **WordPress database volume**: Persistent storage for the WordPress database.
  - **WordPress website files volume**: Persistent storage for WordPress files (themes, plugins, uploads).
- **Docker Network**: Containers communicate over an isolated Docker network to avoid external conflicts.

### Example Directory Structure

```
.
├── Makefile
├── secrets/
│   ├── credentials.txt
│   ├── db_password.txt
│   └── db_root_password.txt
├── srcs/
│   ├── docker-compose.yml
│   ├── .env
│   └── requirements/
│       ├── mariadb/
│       ├── nginx/
│       ├── wordpress/
│       └── tools/
└── .gitignore
```

## Getting Started

To get started with this project on your own machine, follow these steps:

### Prerequisites

Make sure you have the following installed on your system:

- **Docker** (with Docker Compose)
- **Git**

### Setup Instructions

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/inception.git
   cd inception
   ```

2. Create the `.env` file based on the `.env.example` template provided (replace placeholder values).

3. Build and start the containers using `docker-compose`:

   ```bash
   make
   ```

4. You can now access the WordPress site via your custom domain (e.g., `wil.42.fr`).

### NGINX Configuration

- **TLSv1.2 / TLSv1.3**: Only these versions of TLS are supported for secure communication.
- **HTTPS Port**: All communication is handled through HTTPS on port 443.
- **No HTTP (port 80)**: This is restricted in favor of secure communication.

### WordPress Configuration

- A WordPress instance will be automatically installed with the default settings.
- You need to access it through the NGINX container on your specified domain name.

### MariaDB Configuration

- The MariaDB container is configured to create an initial database and a set of users upon startup. The credentials are provided through environment variables.

### Volumes

- Two volumes are created for WordPress: one for the database and one for the website files. These are persisted between container restarts.

## Bonus Features

I also implemented some bonus features to extend the functionality of the infrastructure:

1. **Redis Cache**: Configured a Redis container to cache WordPress data and speed up the website.
2. **FTP Server**: Set up an FTP server for file management within the WordPress container.
3. **Static Website**: Created a simple static website for personal use (resume, portfolio, etc.).
4. **Adminer**: A lightweight database management tool accessible from the browser.
5. **Custom Service**: I chose to set up a custom service that improves my workflow and justifies its usefulness.

## Security Considerations

- **No passwords in Dockerfiles**: All sensitive information is handled via environment variables and Docker secrets.
- **Environment Variables**: Credentials like database passwords are stored securely in a `.env` file and passed into the containers via Docker Compose.
  
## Technologies Used

- **Docker**: Containerization platform for running services in isolated environments.
- **Docker Compose**: Tool for defining and running multi-container Docker applications.
- **NGINX**: Web server and reverse proxy.
- **WordPress**: Content management system (CMS) for creating websites.
- **MariaDB**: Relational database management system (RDBMS).
- **PHP-FPM**: PHP FastCGI Process Manager, used to serve dynamic WordPress content.

## Notes

- **No ready-made Docker images were used**: All Docker images were custom-built for this project.
- **No infinite loops**: The containers are designed to run services as proper daemons without resorting to hacks like `tail -f` or `sleep infinity`.
- **Performance**: The containers are built using Alpine or Debian (penultimate stable version) for optimal performance.

## Final Remarks

This project has been a comprehensive introduction to Docker, containerized services, and system administration. It helped me learn how to set up multiple interconnected services on a single machine and manage them with Docker Compose. I also gained experience working with TLS encryption, environment variables, and secure configurations.

---

This template should help you get started with creating your **README.md**. Adjust any project-specific details as necessary and feel free to add more sections if needed (such as troubleshooting, detailed configurations, etc.).
