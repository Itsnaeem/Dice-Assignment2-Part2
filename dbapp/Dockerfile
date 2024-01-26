# Use an official MySQL runtime as a parent image
FROM mysql:latest

# Environment variables for MySQL
# ENV MYSQL_ROOT_PASSWORD=root_password
# ENV MYSQL_DATABASE=my_database
# ENV MYSQL_USER=my_user
# ENV MYSQL_PASSWORD=my_password

# Create a directory to store initialization scripts
WORKDIR /docker-entrypoint-initdb.d/

# Copy the MySQL script to initialize the database
COPY my_init_script.sql .

# Switch back to the root directory
WORKDIR /

# Expose the default MySQL port
EXPOSE 3306
