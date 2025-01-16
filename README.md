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
6. [Contributing](#contributing)
7. [License](#license)
8. [Acknowledgements](#acknowledgements)

---

## **Introduction**
The goal of this project is to create a small Docker-based infrastructure with services running in isolated containers. You'll be setting up various services (NGINX, WordPress, MariaDB, Redis, FTP, Portainer, etc.) and configuring communication between these containers via a Docker network.

Portainer is used as an additional service for managing Docker containers via a web interface.

---

## **General Guidelines**

- **Virtual Machine (VM)**: This project should be completed within a virtual machine.
- **Directory Structure**: All project-related files should be located in the `srcs/` folder.
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

Clone the repository to your local machine:

```bash
git clone https://github.com/aabderrafie/inception_42
cd inception
```

### **Build the Docker Images**

To build the Docker images and create the necessary directories, use:

```bash
make build
```

This will:
- Build the Docker images for the services defined in `docker-compose.yml`.
- Create necessary directories for the services (WordPress, MariaDB, Redis) if they don't exist.

### **Run the Docker Containers**

Once the images are built, you can start the containers and set up the services by running:

```bash
make up
```

This command will:
- Set up the required directories.
- Start the Docker containers in detached mode (i.e., in the background).

### **Check Logs**

To check the logs of the running containers, you can use:

```bash
make logs
```

This will display the logs for all containers in the system.

### **Stop and Clean Up Containers**

To stop and remove the containers, but keep the data volumes and networks, run:

```bash
make down
```

This command will stop and remove the running containers. It will not remove the volumes or networks that were created for the containers.

### **Clean Up Docker Volumes**

To clean up any unused Docker volumes, you can run:

```bash
make clean
```

This will:
- Stop and remove the containers.
- Prune unused Docker volumes to free up space.

### **Full Cleanup**

To perform a full cleanup, including removing containers, volumes, and data directories, use:

```bash
make fclean
```

This will:
- Stop and remove the containers.
- Prune unused Docker volumes and system resources.
- Remove the data directories (`/home/abderrafie/data/*`), effectively wiping any stored data.

### **Rebuild Everything**

If you want to rebuild everything from scratch (i.e., clean the system and rebuild the images and containers), you can use:

```bash
make re
```

This will:
- Perform a full system clean (`fclean`).
- Rebuild and start the containers from scratch.

### **Check Docker Container Status**

To check the status of all running Docker containers, use:

```bash
make status
```

This command will display the status of all the containers in your infrastructure, including whether they are running or stopped.

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

Here’s an example of the expected directory structure (formatted as a tree):

```bash
$> tree
.
├── Makefile
├── secrets
│   ├── credentials.txt
│   ├── db_password.txt
│   └── db_root_password.txt
└── srcs
    ├── docker-compose.yml
    ├── .env
    ├── requirements
    │   ├── bonus
    │   ├── mariadb
    │   ├── nginx
    │   ├── wordpress
    └── ...
```

---

### **Example File Descriptions:**

- **Makefile**: Automates tasks for building, running, and cleaning up Docker containers.
- **secrets/**: Contains sensitive data like database passwords stored securely.
- **srcs/**: Contains the main application files, including `docker-compose.yml`, `.env`, and service configuration files.

---

### **Additional Notes:**

- Ensure that sensitive information like passwords are **not** hardcoded directly in your Dockerfiles.
- Use `.env` files and **Docker secrets** to securely manage credentials.

---

### Changes:
- Updated the **Installation and Usage** section to reference the `make` commands.
- All `make` commands are now part of the workflow for building, running, and cleaning the containers.

Let me know if any further changes are needed!
