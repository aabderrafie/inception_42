# **Inception Project**

## **Overview**
The **Inception** project is a system administration exercise that expands your knowledge of Docker, containerization, and virtual environments. The project involves building an infrastructure using Docker, where multiple services (NGINX, WordPress, MariaDB, Redis, FTP, Portainer, etc.) run in isolated containers that communicate via a private Docker network.

---

## **Table of Contents**
1. [Introduction](#introduction)
2. [General Guidelines](#general-guidelines)
3. [Mandatory Part](#mandatory-part)
4. [Bonus Part](#bonus-part)
5. [Installation and Usage](#installation-and-usage)
6. [Makefile Commands](#makefile-commands)
7. [Contributing](#contributing)
8. [License](#license)
9. [Acknowledgements](#acknowledgements)

---

## **Introduction**
The goal of this project is to create a small Docker-based infrastructure with services running in isolated containers. You'll be setting up various services (NGINX, WordPress, MariaDB, Redis, FTP, Portainer, etc.) and configuring communication between these containers via a Docker network.

Portainer is used as an additional service for managing Docker containers via a web interface.

---

## **General Guidelines**

- **Virtual Machine (VM)**: This project should be completed within a virtual machine.
- **Directory Structure**: All project-related files should be located in the `srcs/` folder.
- **Makefile**: The provided Makefile automates various tasks like building, running, and cleaning up Docker containers.
- **Docker Setup**: Dockerfiles for each service are provided, which will be built and managed using Docker Compose.
- **Containers**: Each service runs in its own Docker container and restarts automatically in case of a crash.
- **Docker Network**: Containers communicate via a Docker network defined in `docker-compose.yml`.
- **Domain Name**: A custom domain (e.g., `your_login.42.fr`) must be set up to point to your local IP.

---

## **Mandatory Part**

### **Required Services**
You need to set up the following services in Docker containers:

1. **NGINX**:
   - Configure to use only TLSv1.2 or TLSv1.3.
   - Acts as the entry point to your infrastructure via port 443.

2. **WordPress**:
   - Runs with PHP-FPM (without NGINX).
   - Connects to the MariaDB container for the WordPress database.

3. **MariaDB**:
   - Runs the database for WordPress.
   - Includes two database users: one administrator (without `admin` in the username) and one regular user.

4. **Redis** (Bonus):
   - Provides caching for WordPress.

5. **FTP Server** (Bonus):
   - An FTP server for managing WordPress website files.

6. **Portainer** (Bonus):
   - A web-based Docker management interface for managing containers, images, networks, and volumes.

### **Networking**
- All containers should communicate over a Docker network defined in `docker-compose.yml`.
- Ensure no containers are started with infinite loops like `tail -f`, `sleep infinity`, or `while true`.

### **Security**
- **Passwords** and **credentials** should be stored securely using **Docker secrets** and `.env` files.
- Do **not** hardcode passwords in Dockerfiles.

---

## **Bonus Part**

### **Extra Features**
You can add the following features to the project as part of the bonus:

- **Redis Cache**: Set up Redis to cache your WordPress website.
- **FTP Server**: Set up an FTP server to manage WordPress website files.
- **Static Website**: Create a simple static website (excluding PHP).
- **Adminer**: Set up Adminer to manage your MariaDB database through a web interface.
- **Portainer**: Set up Portainer for managing Docker containers via a web interface.
- **Additional Service**: Set up any extra service you find useful and explain its purpose during your defense.

> **Note**: Bonus features will only be evaluated if the mandatory requirements are fully completed.

---

## **Installation and Usage**

### **Clone the Repository**
Clone the repository to your local machine using:

```bash
git clone https://github.com/aabderrafie/inception_42
cd inception
```

### **Build the Docker Images**
Run the following command to build the Docker images:

```bash
make build
```

### **Run the Docker Containers**
To start the containers and set up the services:

```bash
make up
```

This will start all the necessary containers in detached mode.

### **Check Logs**
To view logs for the running containers:

```bash
make logs
```

### **Stop and Clean Up Containers**
To stop and remove the containers:

```bash
make down
```

This command stops and removes the containers but does not remove volumes or networks.

### **Full Cleanup**
To clean up Docker volumes and system resources:

```bash
make clean
```

This will remove unused Docker volumes.

### **Full System Clean**
To completely clean up the system, including volumes and unused Docker system resources:

```bash
make fclean
```

This command performs a full system clean and removes all data directories.

### **Rebuild Everything**
To rebuild all containers and services from scratch:

```bash
make re
```

### **Check Docker Container Status**
To check the status of your Docker containers:

```bash
make status
```

---

## **Makefile Commands**

Below is a list of available Makefile commands:

### **all**
Runs the `build` and `up` commands to build Docker images and bring up the containers.

```bash
make all
```

### **build**
Builds the Docker images for all services defined in `docker-compose.yml`.

```bash
make build
```

### **up**
Sets up the necessary directories and starts the Docker containers.

```bash
make up
```

### **down**
Stops and removes the running containers.

```bash
make down
```

### **clean**
Stops and removes containers and then prunes unused Docker volumes.

```bash
make clean
```

### **fclean**
Performs a full system cleanup by stopping and removing containers, cleaning up volumes, and removing data directories.

```bash
make fclean
```

### **re**
Rebuilds everything from scratch by running `fclean` and `all`.

```bash
make re
```

### **status**
Displays the status of all running Docker containers.

```bash
make status
```

---

## **Contributing**
Contributions are welcome! To contribute:

1. Fork the repository.
2. Make your changes.
3. Create a pull request.

---

## **License**
This project is licensed under the MIT License. See the LICENSE file for more details.

---

## **Acknowledgements**
- **42 Network**: Special thanks to the 42 Network for providing the platform and community for this project.
- **Docker Documentation**: A big thanks to Docker’s official documentation for making it easier to learn and implement Docker concepts.
- **Community**: Thanks to the open-source community for their guidance and support.

---

### **Example Directory Structure**
Here’s an example of the expected directory structure:

```bash
$> ls -alR
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxrwt 17 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 Makefile
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 secrets
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 srcs
./secrets:
total XX
drwxrwxr-x 2 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 6 wil wil 4096 avril 42 20:42 ..
-rw-r--r-- 1 wil wil XXXX avril 42 20:42 credentials.txt
-rw-r--r-- 1 wil wil XXXX avril 42 20:42 db_password.txt
-rw-r--r-- 1 wil wil XXXX avril 42 20:42 db_root_password.txt
./srcs:
total XX
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 docker-compose.yml
-rw-rw-r-- 1 wil wil XXXX avril 42 20:42 .env
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 requirements
./srcs/requirements:
total XX
drwxrwxr-x 5 wil wil 4096 avril 42 20:42 .
drwxrwxr-x 3 wil wil 4096 avril 42 20:42 ..
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 bonus
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 mariadb
drwxrwxr-x 4 wil wil 4096 avril 42 20:42 nginx
drwxrwxr-x
