# Dice-Assignment2-Part2
This part will test the understanding of Docker Compose and how to use it 

● Create a Docker file for the web application container which should include the necessary
dependencies to run the web application. The web application should display a simple
"Hello, World!" message when accessed from a web browser. 

In this I create python webapp which saying "Hello World"

**webapp**:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
```
then there is **requirement.txt** file. which contains:

Flask
Werkzeug

Then I make **Dockerfile** of this APP.

```
# Use an official Python runtime as a parent image
FROM python

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

#define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]

```
then I create a build of this app using below command:

```bash
docker build -t my-web-app
```

output is :

```
docker build -t my-web-app .
[+] Building 136.3s (9/9) FINISHED                                                                                                           docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                         0.0s
 => => transferring dockerfile: 439B                                                                                                                         0.0s
 => [internal] load .dockerignore                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [internal] load metadata for docker.io/library/python:latest                                                                                             3.1s
 => [1/4] FROM docker.io/library/python@sha256:a09f71f4af992ddf9a620330fed343c850c371251be45c3f9bb46ebeca49c9c6                                             99.3s
 => => resolve docker.io/library/python@sha256:a09f71f4af992ddf9a620330fed343c850c371251be45c3f9bb46ebeca49c9c6                                              0.0s
 => => sha256:e7177b0afd0e42e14451befc9140f9fe2749c1af93b627fbe62444eedf7dc153 7.12kB / 7.12kB                                                               0.0s
 => => sha256:30d85599795460b2d9d24c6b87c53ec60555b601705cc83bea31632240500980 64.14MB / 64.14MB                                                            36.0s
 => => sha256:a09f71f4af992ddf9a620330fed343c850c371251be45c3f9bb46ebeca49c9c6 2.14kB / 2.14kB                                                               0.0s
 => => sha256:374e74dd816f68285aee7c255308829df53349134dc42c42908b69e301324c2c 2.01kB / 2.01kB                                                               0.0s
 => => sha256:ad5739181616b815fae7edc6bba689496674acbcf44e48a57fc7cc13a379b3a2 211.10MB / 211.10MB                                                          91.7s
 => => sha256:75e2b45cbee50cea4b3ed4f4fe167ad5994622d77a54adde89adcfeefa3c229a 6.39MB / 6.39MB                                                              11.8s
 => => sha256:fa6efb383f8129696e34616a2fd5113fbd12cd57e94d9cd32290ec4bcea704be 22.67MB / 22.67MB                                                            26.8s
 => => sha256:0c6213e9c29bd23ac945087af6300f7076d3c04033dcb4cc32c9924e31c70bbd 245B / 245B                                                                  27.6s
 => => sha256:1b1e18053fdc6f1bda6c3abd98ecfd660b0251ff64aa7751163f894baf78f837 2.68MB / 2.68MB                                                              28.5s
 => => extracting sha256:30d85599795460b2d9d24c6b87c53ec60555b601705cc83bea31632240500980                                                                    2.1s
 => => extracting sha256:ad5739181616b815fae7edc6bba689496674acbcf44e48a57fc7cc13a379b3a2                                                                    6.1s
 => => extracting sha256:75e2b45cbee50cea4b3ed4f4fe167ad5994622d77a54adde89adcfeefa3c229a                                                                    0.3s
 => => extracting sha256:fa6efb383f8129696e34616a2fd5113fbd12cd57e94d9cd32290ec4bcea704be                                                                    0.6s
 => => extracting sha256:0c6213e9c29bd23ac945087af6300f7076d3c04033dcb4cc32c9924e31c70bbd                                                                    0.0s
 => => extracting sha256:1b1e18053fdc6f1bda6c3abd98ecfd660b0251ff64aa7751163f894baf78f837                                                                    0.2s
 => [internal] load build context                                                                                                                            0.0s
 => => transferring context: 500B                                                                                                                            0.0s
 => [2/4] WORKDIR /app                                                                                                                                       0.8s
 => [3/4] COPY . /app                                                                                                                                        0.0s
 => [4/4] RUN pip install -r requirements.txt                                                                                                               32.8s
 => exporting to image                                                                                                                                       0.2s 
 => => exporting layers                                                                                                                                      0.2s 
 => => writing image sha256:7b9092fe58fa345a3a3ecf064137502318452d925ca8ac00b4b56246c0c61f45                                                                 0.0s 
 => => naming to docker.io/library/my-web-app                                                                                                                0.0s 
                                                                                                                                                                  
View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/cawe8z5eq25vuo1ov25i4nfe4                                                        

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview
```


then run this app using this command:

```bash
docker run -p 4000:80 my-web-app
```
output is:

```
docker run -p 4000:80 my-web-app
 * Serving Flask app 'app'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:80
 * Running on http://172.17.0.3:80
Press CTRL+C to quit

```
yes in browser it is accessed & showing the Hello world!

● Create a Docker file for the database container which should include the
necessarydependencies to run the database. You can use any database of your
choice (e.g.,MySQL, PostgreSQL, MongoDB, etc.).

in this part, I am selected mysql database.

I create dbapp directory & make the files there.

I created two file a if Dockerfile & second is my_init_script.sql

in **Dockerfile** content:

```
# Use an official MySQL runtime as a parent image
FROM mysql:latest

WORKDIR /docker-entrypoint-initdb.d/

# Copy the MySQL script to initialize the database
COPY my_init_script.sql .

# Switch back to the root directory
WORKDIR /

# Expose the default MySQL port
EXPOSE 3306

```

in `my_init_Script.sql`
```
 -- Create a new database
CREATE DATABASE IF NOT EXISTS my_database;

-- Switch to the newly created database
USE my_database;

-- Create a sample table
CREATE TABLE IF NOT EXISTS my_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

-- Insert some sample data into the table
INSERT INTO my_table (name, age) VALUES
    ('John Doe', 30),
    ('Jane Doe', 25),
    ('Bob Smith', 35);
```

then create the build of mysql.

```bash
docker build -t my-mysql-image .
```

output is:

```
docker build -t my-mysql-image .
[+] Building 91.3s (8/8) FINISHED                                                                                                                          docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                       0.0s
 => => transferring dockerfile: 526B                                                                                                                                       0.0s
 => [internal] load .dockerignore                                                                                                                                          0.0s
 => => transferring context: 2B                                                                                                                                            0.0s
 => [internal] load metadata for docker.io/library/mysql:latest                                                                                                            0.7s
 => [1/4] FROM docker.io/library/mysql:latest@sha256:d7c20c5ba268c558f4fac62977f8c7125bde0630ff8946b08dde44135ef40df3                                                     89.8s
 => => resolve docker.io/library/mysql:latest@sha256:d7c20c5ba268c558f4fac62977f8c7125bde0630ff8946b08dde44135ef40df3                                                      0.0s
 => => sha256:d7c20c5ba268c558f4fac62977f8c7125bde0630ff8946b08dde44135ef40df3 1.95kB / 1.95kB                                                                             0.0s
 => => sha256:6d5a11994be8ca5e4cfaf4d370219f6eb6ef8fb41d57f9ed1568a93ffd5471ef 2.56kB / 2.56kB                                                                             0.0s
 => => sha256:56b21e040954f63d922725c2d049cf2a0dfbad5522e8d3e14c36f1823ab3f5e5 6.55kB / 6.55kB                                                                             0.0s
 => => sha256:558b7d69a2e576e93c7cb18ecd087a92959e912b116323c188183d5cf8ab5b17 51.32MB / 51.32MB                                                                          80.3s
 => => sha256:b85878fb9bb201455b25020f87c8a00ecd14a7ff7e95f5eac360609b47c40e34 982.81kB / 982.81kB                                                                         1.2s
 => => sha256:2cb5a921059e3898005818f7f80347bafc9800da5d427517f0713d2db0d167a0 885B / 885B                                                                                 1.1s
 => => sha256:d16f3fd26a8227c3566f7b9f27ec3ad511b3f28551ea9bc1a2decd885136709f 4.59MB / 4.59MB                                                                             8.7s
 => => sha256:afd51b5329cbeda564171e38873f6afa0ed11eecc5be923170862f1be7dcff0f 2.60kB / 2.60kB                                                                             1.5s
 => => sha256:374d2f7f3267229ec55c2bd4fc4ce43ab0e34aeb60c297c7e83da433cc260cc0 340B / 340B                                                                                 1.7s
 => => sha256:4ea1bb2c95740adb15e9e07fe75f7788e4f767c4048041b448b55fedd60d05cf 63.09MB / 63.09MB                                                                          65.7s
 => => sha256:1c905405360553567280bcac35bbf3b613048ee32a9e8c43ef1f3690c8609de7 326B / 326B                                                                                 9.1s
 => => sha256:d79cd2da03be475c108253eb3d1f98e7567fde5455fe95af2d645cb2cfb99949 63.37MB / 63.37MB                                                                          65.2s
 => => sha256:e3a1aa788d17b88e63b294e49ca7166003652f4df88db20739aa2a4847d32f9f 5.18kB / 5.18kB                                                                            69.2s
 => => extracting sha256:558b7d69a2e576e93c7cb18ecd087a92959e912b116323c188183d5cf8ab5b17                                                                                  1.3s
 => => extracting sha256:2cb5a921059e3898005818f7f80347bafc9800da5d427517f0713d2db0d167a0                                                                                  0.0s
 => => extracting sha256:b85878fb9bb201455b25020f87c8a00ecd14a7ff7e95f5eac360609b47c40e34                                                                                  0.0s
 => => extracting sha256:d16f3fd26a8227c3566f7b9f27ec3ad511b3f28551ea9bc1a2decd885136709f                                                                                  0.2s
 => => extracting sha256:afd51b5329cbeda564171e38873f6afa0ed11eecc5be923170862f1be7dcff0f                                                                                  0.0s
 => => extracting sha256:374d2f7f3267229ec55c2bd4fc4ce43ab0e34aeb60c297c7e83da433cc260cc0                                                                                  0.0s
 => => extracting sha256:4ea1bb2c95740adb15e9e07fe75f7788e4f767c4048041b448b55fedd60d05cf                                                                                  1.4s
 => => extracting sha256:1c905405360553567280bcac35bbf3b613048ee32a9e8c43ef1f3690c8609de7                                                                                  0.0s
 => => extracting sha256:d79cd2da03be475c108253eb3d1f98e7567fde5455fe95af2d645cb2cfb99949                                                                                  5.3s
 => => extracting sha256:e3a1aa788d17b88e63b294e49ca7166003652f4df88db20739aa2a4847d32f9f                                                                                  0.0s
 => [internal] load build context                                                                                                                                          0.0s
 => => transferring context: 473B                                                                                                                                          0.0s
 => [2/4] WORKDIR /docker-entrypoint-initdb.d/                                                                                                                             0.6s
 => [3/4] COPY my_init_script.sql .                                                                                                                                        0.0s
 => exporting to image                                                                                                                                                     0.0s
 => => exporting layers                                                                                                                                                    0.0s
 => => writing image sha256:f43fb1e1393c214efba5508e7cf4abdc69bbfc43f725c882b25b100ad9cc9b3a                                                                               0.0s
 => => naming to docker.io/library/my-mysql-image                                                                                                                          0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/2p2gs40akjr2bbm3e8ocyje68

What's Next?
  1. Sign in to your Docker account → docker login
  2. View a summary of image vulnerabilities and recommendations → docker scout quickview
```

```bash
docker run -d --name my-mysql-container -p 3306:3306 my-mysql-image
```

After this I check this in mysql client its working.


● Create a docker-compose.yml file that defines the two services - web and database. The web service should be linked to the database service using Docker Compose networking. 

I creat a docker compose file of webapp & dbapp.

```
version: '3.8'

services:
  webapp:
    build:
      context: ./webapp
      dockerfile: Dockerfile
    ports:
      - "3000:80"
    networks:
      - my_network
    depends_on:
      - dbapp

  dbapp:
    build:
      context: ./dbapp
      dockerfile: Dockerfile
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: my_database
      MYSQL_USER: my_user
      MYSQL_PASSWORD: my_password
    ports:
      - "3307:3306"
    networks:
      - my_network

networks:
  my_network:

```

● Use the docker-compose up command to build and run the application. Verify that the
web application is accessible from a web browser and that the database is running. 

```bash
docker compose up
```

```
docker compose up --build 
[+] Building 7.5s (17/17) FINISHED                                                                                                           docker:desktop-linux
 => [dbapp internal] load .dockerignore                                                                                                                      0.4s
 => => transferring context: 2B                                                                                                                              0.0s
 => [dbapp internal] load build definition from Dockerfile                                                                                                   0.5s
 => => transferring dockerfile: 534B                                                                                                                         0.0s
 => [dbapp internal] load metadata for docker.io/library/mysql:latest                                                                                        1.2s
 => [dbapp 1/4] FROM docker.io/library/mysql:latest@sha256:d7c20c5ba268c558f4fac62977f8c7125bde0630ff8946b08dde44135ef40df3                                  0.0s
 => [dbapp internal] load build context                                                                                                                      0.4s
 => => transferring context: 40B                                                                                                                             0.0s
 => CACHED [dbapp 2/4] WORKDIR /docker-entrypoint-initdb.d/                                                                                                  0.0s
 => CACHED [dbapp 3/4] COPY my_init_script.sql .                                                                                                             0.0s
 => [dbapp] exporting to image                                                                                                                               0.2s
 => => exporting layers                                                                                                                                      0.0s
 => => writing image sha256:e56d2724e99cfaa9fa787bab041fab0bfbd5c247123690a05a8c83ebe3be96d9                                                                 0.1s
 => => naming to docker.io/library/dice-assignment2-part2-dbapp                                                                                              0.1s
 => [webapp internal] load build definition from Dockerfile                                                                                                  0.0s
 => => transferring dockerfile: 439B                                                                                                                         0.0s
 => [webapp internal] load .dockerignore                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [webapp internal] load metadata for docker.io/library/python:latest                                                                                      1.8s
 => [webapp 1/4] FROM docker.io/library/python@sha256:a09f71f4af992ddf9a620330fed343c850c371251be45c3f9bb46ebeca49c9c6                                       0.0s
 => [webapp internal] load build context                                                                                                                     0.5s
 => => transferring context: 93B                                                                                                                             0.0s
 => CACHED [webapp 2/4] WORKDIR /app                                                                                                                         0.0s
 => CACHED [webapp 3/4] COPY . /app                                                                                                                          0.0s
 => CACHED [webapp 4/4] RUN pip install -r requirements.txt                                                                                                  0.0s
 => [webapp] exporting to image                                                                                                                              0.1s
 => => exporting layers                                                                                                                                      0.0s
 => => writing image sha256:38370cf834868874f6fdf287130ba53122eb566e2ced2affe63ad0690836be66                                                                 0.1s
 => => naming to docker.io/library/dice-assignment2-part2-webapp                                                                                             0.1s
WARN[0007] Found orphan containers ([dice-assignment2-part2-web-1 dice-assignment2-part2-database-1]) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up. 
[+] Running 2/0
 ✔ Container dice-assignment2-part2-dbapp-1   Created                                                                                                        0.0s 
 ✔ Container dice-assignment2-part2-webapp-1  Created                                                                                                        0.0s 
Attaching to dbapp-1, webapp-1
dbapp-1   | 2024-01-25 12:40:45+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
dbapp-1   | 2024-01-25 12:40:45+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
dbapp-1   | 2024-01-25 12:40:45+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
dbapp-1   | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
webapp-1  |  * Serving Flask app 'app'
webapp-1  |  * Debug mode: off
webapp-1  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
webapp-1  |  * Running on all addresses (0.0.0.0)
webapp-1  |  * Running on http://127.0.0.1:80
webapp-1  |  * Running on http://172.20.0.3:80
webapp-1  | Press CTRL+C to quit
dbapp-1   | 2024-01-25T12:40:45.791495Z 0 [System] [MY-015015] [Server] MySQL Server - start.
dbapp-1   | 2024-01-25T12:40:45.987265Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.3.0) starting as process 1
dbapp-1   | 2024-01-25T12:40:45.993895Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
dbapp-1   | 2024-01-25T12:40:46.245178Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-25T12:40:46.563358Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
dbapp-1   | 2024-01-25T12:40:46.563393Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
dbapp-1   | 2024-01-25T12:40:46.567719Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
dbapp-1   | 2024-01-25T12:40:46.628471Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
dbapp-1   | 2024-01-25T12:40:46.628505Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.3.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
```

● Modify the Docker file for the web application container to include a new feature (e.g.,a new message, a new page, etc.).Rebuild the web application container and redeploy the application using docker-compose. Verify that the new feature is working as expected. 

I change the line of Hello World in APP code.

```
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World! its docker compose'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)

```

rebuild the docker compose using this command
```bash
docker compose up --build
```

output is :

```
docker compose up --build 
[+] Building 13.2s (17/17) FINISHED                                                                                                          docker:desktop-linux
 => [dbapp internal] load build definition from Dockerfile                                                                                                   0.0s
 => => transferring dockerfile: 534B                                                                                                                         0.0s
 => [dbapp internal] load .dockerignore                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [dbapp internal] load metadata for docker.io/library/mysql:latest                                                                                        1.9s
 => [dbapp 1/4] FROM docker.io/library/mysql:latest@sha256:d7c20c5ba268c558f4fac62977f8c7125bde0630ff8946b08dde44135ef40df3                                  0.0s
 => [dbapp internal] load build context                                                                                                                      0.0s
 => => transferring context: 40B                                                                                                                             0.0s
 => CACHED [dbapp 2/4] WORKDIR /docker-entrypoint-initdb.d/                                                                                                  0.0s
 => CACHED [dbapp 3/4] COPY my_init_script.sql .                                                                                                             0.0s
 => [dbapp] exporting to image                                                                                                                               0.0s
 => => exporting layers                                                                                                                                      0.0s
 => => writing image sha256:e56d2724e99cfaa9fa787bab041fab0bfbd5c247123690a05a8c83ebe3be96d9                                                                 0.0s
 => => naming to docker.io/library/dice-assignment2-part2-dbapp                                                                                              0.0s
 => [webapp internal] load .dockerignore                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [webapp internal] load build definition from Dockerfile                                                                                                  0.0s
 => => transferring dockerfile: 439B                                                                                                                         0.0s
 => [webapp internal] load metadata for docker.io/library/python:latest                                                                                      2.3s
 => [webapp 1/4] FROM docker.io/library/python@sha256:a09f71f4af992ddf9a620330fed343c850c371251be45c3f9bb46ebeca49c9c6                                       0.0s
 => [webapp internal] load build context                                                                                                                     0.0s
 => => transferring context: 298B                                                                                                                            0.0s
 => CACHED [webapp 2/4] WORKDIR /app                                                                                                                         0.0s
 => [webapp 3/4] COPY . /app                                                                                                                                 0.0s
 => [webapp 4/4] RUN pip install -r requirements.txt                                                                                                         8.5s
 => [webapp] exporting to image                                                                                                                              0.2s 
 => => exporting layers                                                                                                                                      0.2s 
 => => writing image sha256:8bbdd6f51702068ac55459ffba0ce4884b2824c4644e0407cd713adfa47f9f0d                                                                 0.0s 
 => => naming to docker.io/library/dice-assignment2-part2-webapp                                                                                             0.0s 
[+] Running 3/3                                                                                                                                                   
 ✔ Network dice-assignment2-part2_my_network  Created                                                                                                        0.1s 
 ✔ Container dice-assignment2-part2-dbapp-1   Created                                                                                                        0.1s 
 ✔ Container dice-assignment2-part2-webapp-1  Created                                                                                                        0.1s 
Attaching to dbapp-1, webapp-1
dbapp-1   | 2024-01-26 05:23:10+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
webapp-1  |  * Serving Flask app 'app'
webapp-1  |  * Debug mode: off
webapp-1  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
webapp-1  |  * Running on all addresses (0.0.0.0)
webapp-1  |  * Running on http://127.0.0.1:80
webapp-1  |  * Running on http://172.19.0.3:80
webapp-1  | Press CTRL+C to quit
dbapp-1   | 2024-01-26 05:23:11+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
dbapp-1   | 2024-01-26 05:23:11+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
dbapp-1   | 2024-01-26 05:23:11+00:00 [Note] [Entrypoint]: Initializing database files
dbapp-1   | 2024-01-26T05:23:11.627330Z 0 [System] [MY-015017] [Server] MySQL Server Initialization - start.
dbapp-1   | 2024-01-26T05:23:11.629077Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.3.0) initializing of server in progress as process 80
dbapp-1   | 2024-01-26T05:23:11.646009Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
dbapp-1   | 2024-01-26T05:23:12.432950Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-26T05:23:13.996429Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
dbapp-1   | 2024-01-26T05:23:25.380573Z 0 [System] [MY-015018] [Server] MySQL Server Initialization - end.
dbapp-1   | 2024-01-26 05:23:25+00:00 [Note] [Entrypoint]: Database files initialized
dbapp-1   | 2024-01-26 05:23:25+00:00 [Note] [Entrypoint]: Starting temporary server
dbapp-1   | 2024-01-26T05:23:25.415433Z 0 [System] [MY-015015] [Server] MySQL Server - start.
dbapp-1   | 2024-01-26T05:23:25.759151Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.3.0) starting as process 124
dbapp-1   | 2024-01-26T05:23:25.782335Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
dbapp-1   | 2024-01-26T05:23:26.085993Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-26T05:23:26.795975Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
dbapp-1   | 2024-01-26T05:23:26.796145Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
dbapp-1   | 2024-01-26T05:23:26.800669Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
dbapp-1   | 2024-01-26T05:23:26.830657Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
dbapp-1   | 2024-01-26T05:23:26.830832Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.3.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
dbapp-1   | 2024-01-26 05:23:26+00:00 [Note] [Entrypoint]: Temporary server started.
dbapp-1   | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
dbapp-1   | 2024-01-26 05:23:29+00:00 [Note] [Entrypoint]: Creating database my_database
dbapp-1   | 2024-01-26 05:23:29+00:00 [Note] [Entrypoint]: Creating user my_user
dbapp-1   | 2024-01-26 05:23:30+00:00 [Note] [Entrypoint]: Giving user my_user access to schema my_database
dbapp-1   | 
dbapp-1   | 2024-01-26 05:23:30+00:00 [Note] [Entrypoint]: /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/my_init_script.sql
dbapp-1   | 
dbapp-1   | 
dbapp-1   | 2024-01-26 05:23:30+00:00 [Note] [Entrypoint]: Stopping temporary server
dbapp-1   | 2024-01-26T05:23:30.142847Z 14 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.3.0).
dbapp-1   | 2024-01-26T05:23:32.622325Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.3.0)  MySQL Community Server - GPL.
dbapp-1   | 2024-01-26T05:23:32.622352Z 0 [System] [MY-015016] [Server] MySQL Server - end.
dbapp-1   | 2024-01-26 05:23:33+00:00 [Note] [Entrypoint]: Temporary server stopped
dbapp-1   | 
dbapp-1   | 2024-01-26 05:23:33+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
dbapp-1   | 
dbapp-1   | 2024-01-26T05:23:33.157298Z 0 [System] [MY-015015] [Server] MySQL Server - start.
dbapp-1   | 2024-01-26T05:23:33.356810Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.3.0) starting as process 1
dbapp-1   | 2024-01-26T05:23:33.366236Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
dbapp-1   | 2024-01-26T05:23:33.586832Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-26T05:23:33.847492Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
dbapp-1   | 2024-01-26T05:23:33.847519Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
dbapp-1   | 2024-01-26T05:23:33.850918Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
dbapp-1   | 2024-01-26T05:23:33.885378Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
dbapp-1   | 2024-01-26T05:23:33.885527Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.3.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.

```

● Implement a backup strategy for the database. This can be achieved using a Docker volume or by running a backup script periodically.

Using docker compose I will define the volume for saving the mysql data in that volume.

docker compose file.

output is:

```
version: '3.8'

services:
  webapp:
    build:
      context: ./webapp
      dockerfile: Dockerfile
    ports:
      - "3000:80"
    networks:
      - my_network
    depends_on:
      - dbapp

  dbapp:
    build:
      context: ./dbapp
      dockerfile: Dockerfile
    environment:
      MYSQL_ROOT_PASSWORD: root_password
      MYSQL_DATABASE: my_database
      MYSQL_USER: my_user
      MYSQL_PASSWORD: my_password
    ports:
      - "3307:3306"
    networks:
      - my_network
    volumes:
      - mysql_data:/var/lib/mysql

networks:
  my_network:

volumes:
  mysql_data:

```

after this rebuild again docker compose.

```
docker compose up --build 
[+] Building 9.0s (17/17) FINISHED                                                                                                           docker:desktop-linux
 => [dbapp internal] load build definition from Dockerfile                                                                                                   0.0s
 => => transferring dockerfile: 534B                                                                                                                         0.0s
 => [dbapp internal] load .dockerignore                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [dbapp internal] load metadata for docker.io/library/mysql:latest                                                                                        1.6s
 => [dbapp 1/4] FROM docker.io/library/mysql:latest@sha256:d7c20c5ba268c558f4fac62977f8c7125bde0630ff8946b08dde44135ef40df3                                  0.0s
 => [dbapp internal] load build context                                                                                                                      0.0s
 => => transferring context: 40B                                                                                                                             0.0s
 => CACHED [dbapp 2/4] WORKDIR /docker-entrypoint-initdb.d/                                                                                                  0.0s
 => CACHED [dbapp 3/4] COPY my_init_script.sql .                                                                                                             0.0s
 => [dbapp] exporting to image                                                                                                                               0.0s
 => => exporting layers                                                                                                                                      0.0s
 => => writing image sha256:e56d2724e99cfaa9fa787bab041fab0bfbd5c247123690a05a8c83ebe3be96d9                                                                 0.0s
 => => naming to docker.io/library/dice-assignment2-part2-dbapp                                                                                              0.0s
 => [webapp internal] load .dockerignore                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [webapp internal] load build definition from Dockerfile                                                                                                  0.0s
 => => transferring dockerfile: 439B                                                                                                                         0.0s
 => [webapp internal] load metadata for docker.io/library/python:latest                                                                                      7.1s
 => [webapp 1/4] FROM docker.io/library/python@sha256:a09f71f4af992ddf9a620330fed343c850c371251be45c3f9bb46ebeca49c9c6                                       0.0s
 => [webapp internal] load build context                                                                                                                     0.0s
 => => transferring context: 93B                                                                                                                             0.0s
 => CACHED [webapp 2/4] WORKDIR /app                                                                                                                         0.0s
 => CACHED [webapp 3/4] COPY . /app                                                                                                                          0.0s
 => CACHED [webapp 4/4] RUN pip install -r requirements.txt                                                                                                  0.0s
 => [webapp] exporting to image                                                                                                                              0.0s
 => => exporting layers                                                                                                                                      0.0s
 => => writing image sha256:8bbdd6f51702068ac55459ffba0ce4884b2824c4644e0407cd713adfa47f9f0d                                                                 0.0s
 => => naming to docker.io/library/dice-assignment2-part2-webapp                                                                                             0.0s
[+] Running 3/3
 ✔ Volume "dice-assignment2-part2_mysql_data"  Created                                                                                                       0.0s 
 ✔ Container dice-assignment2-part2-dbapp-1    Recreated                                                                                                     0.2s 
 ✔ Container dice-assignment2-part2-webapp-1   Recreated                                                                                                     0.1s 
Attaching to dbapp-1, webapp-1
dbapp-1   | 2024-01-26 05:33:14+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
dbapp-1   | 2024-01-26 05:33:14+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
dbapp-1   | 2024-01-26 05:33:14+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
dbapp-1   | 2024-01-26 05:33:14+00:00 [Note] [Entrypoint]: Initializing database files
dbapp-1   | 2024-01-26T05:33:14.950675Z 0 [System] [MY-015017] [Server] MySQL Server Initialization - start.
dbapp-1   | 2024-01-26T05:33:14.953887Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.3.0) initializing of server in progress as process 80
dbapp-1   | 2024-01-26T05:33:14.964136Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
webapp-1  |  * Serving Flask app 'app'
webapp-1  |  * Debug mode: off
webapp-1  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
webapp-1  |  * Running on all addresses (0.0.0.0)
webapp-1  |  * Running on http://127.0.0.1:80
webapp-1  |  * Running on http://172.19.0.3:80
webapp-1  | Press CTRL+C to quit
dbapp-1   | 2024-01-26T05:33:15.873943Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-26T05:33:17.813066Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
dbapp-1   | 2024-01-26T05:33:33.518987Z 0 [System] [MY-015018] [Server] MySQL Server Initialization - end.
dbapp-1   | 2024-01-26 05:33:33+00:00 [Note] [Entrypoint]: Database files initialized
dbapp-1   | 2024-01-26 05:33:33+00:00 [Note] [Entrypoint]: Starting temporary server
dbapp-1   | 2024-01-26T05:33:33.553164Z 0 [System] [MY-015015] [Server] MySQL Server - start.
dbapp-1   | 2024-01-26T05:33:33.734703Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.3.0) starting as process 124
dbapp-1   | 2024-01-26T05:33:33.810683Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
dbapp-1   | 2024-01-26T05:33:36.941383Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-26T05:33:38.828019Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
dbapp-1   | 2024-01-26T05:33:38.828058Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
dbapp-1   | 2024-01-26T05:33:38.830856Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
dbapp-1   | 2024-01-26T05:33:38.850952Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: /var/run/mysqld/mysqlx.sock
dbapp-1   | 2024-01-26T05:33:38.851158Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.3.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
dbapp-1   | 2024-01-26 05:33:38+00:00 [Note] [Entrypoint]: Temporary server started.
dbapp-1   | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
dbapp-1   | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
dbapp-1   | 2024-01-26 05:33:42+00:00 [Note] [Entrypoint]: Creating database my_database
dbapp-1   | 2024-01-26 05:33:42+00:00 [Note] [Entrypoint]: Creating user my_user
dbapp-1   | 2024-01-26 05:33:42+00:00 [Note] [Entrypoint]: Giving user my_user access to schema my_database
dbapp-1   | 
dbapp-1   | 2024-01-26 05:33:42+00:00 [Note] [Entrypoint]: /usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/my_init_script.sql
dbapp-1   | 
dbapp-1   | 
dbapp-1   | 2024-01-26 05:33:42+00:00 [Note] [Entrypoint]: Stopping temporary server
dbapp-1   | 2024-01-26T05:33:42.180812Z 14 [System] [MY-013172] [Server] Received SHUTDOWN from user root. Shutting down mysqld (Version: 8.3.0).
dbapp-1   | 2024-01-26T05:33:49.542997Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.3.0)  MySQL Community Server - GPL.
dbapp-1   | 2024-01-26T05:33:49.543067Z 0 [System] [MY-015016] [Server] MySQL Server - end.
dbapp-1   | 2024-01-26 05:33:50+00:00 [Note] [Entrypoint]: Temporary server stopped
dbapp-1   | 
dbapp-1   | 2024-01-26 05:33:50+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.
dbapp-1   | 
dbapp-1   | 2024-01-26T05:33:50.193597Z 0 [System] [MY-015015] [Server] MySQL Server - start.
dbapp-1   | 2024-01-26T05:33:50.391275Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.3.0) starting as process 1
dbapp-1   | 2024-01-26T05:33:50.399419Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
dbapp-1   | 2024-01-26T05:33:50.581618Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-26T05:33:50.844823Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
dbapp-1   | 2024-01-26T05:33:50.844865Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
dbapp-1   | 2024-01-26T05:33:50.848041Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
dbapp-1   | 2024-01-26T05:33:50.875509Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
dbapp-1   | 2024-01-26T05:33:50.875639Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.3.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
```

● Implement a scaling strategy for the web application. This can be achieved by using the docker-compose scale command to create multiple instances of the web service. Verify that the web application is accessible and working correctly when scaled.

In this part , I commented out the ports then, use the command to build three web app.

```bash
docker compose up --scale webapp=3 --build
```

and the output is:
```
[+] Building 3.1s (17/17) FINISHED                                                                                                           docker:desktop-linux
 => [dbapp internal] load .dockerignore                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [dbapp internal] load build definition from Dockerfile                                                                                                   0.0s
 => => transferring dockerfile: 534B                                                                                                                         0.0s
 => [dbapp internal] load metadata for docker.io/library/mysql:latest                                                                                        1.4s
 => [dbapp 1/4] FROM docker.io/library/mysql:latest@sha256:d7c20c5ba268c558f4fac62977f8c7125bde0630ff8946b08dde44135ef40df3                                  0.0s
 => [dbapp internal] load build context                                                                                                                      0.0s
 => => transferring context: 40B                                                                                                                             0.0s
 => CACHED [dbapp 2/4] WORKDIR /docker-entrypoint-initdb.d/                                                                                                  0.0s
 => CACHED [dbapp 3/4] COPY my_init_script.sql .                                                                                                             0.0s
 => [dbapp] exporting to image                                                                                                                               0.0s
 => => exporting layers                                                                                                                                      0.0s
 => => writing image sha256:e56d2724e99cfaa9fa787bab041fab0bfbd5c247123690a05a8c83ebe3be96d9                                                                 0.0s
 => => naming to docker.io/library/dice-assignment2-part2-dbapp                                                                                              0.0s
 => [webapp internal] load .dockerignore                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                              0.0s
 => [webapp internal] load build definition from Dockerfile                                                                                                  0.0s
 => => transferring dockerfile: 439B                                                                                                                         0.0s
 => [webapp internal] load metadata for docker.io/library/python:latest                                                                                      1.4s
 => [webapp 1/4] FROM docker.io/library/python@sha256:a09f71f4af992ddf9a620330fed343c850c371251be45c3f9bb46ebeca49c9c6                                       0.0s
 => [webapp internal] load build context                                                                                                                     0.0s
 => => transferring context: 93B                                                                                                                             0.0s
 => CACHED [webapp 2/4] WORKDIR /app                                                                                                                         0.0s
 => CACHED [webapp 3/4] COPY . /app                                                                                                                          0.0s
 => CACHED [webapp 4/4] RUN pip install -r requirements.txt                                                                                                  0.0s
 => [webapp] exporting to image                                                                                                                              0.0s
 => => exporting layers                                                                                                                                      0.0s
 => => writing image sha256:8bbdd6f51702068ac55459ffba0ce4884b2824c4644e0407cd713adfa47f9f0d                                                                 0.0s
 => => naming to docker.io/library/dice-assignment2-part2-webapp                                                                                             0.0s
[+] Running 4/4
 ✔ Container dice-assignment2-part2-dbapp-1   Recreated                                                                                                      1.1s 
 ✔ Container dice-assignment2-part2-webapp-3  Recreated                                                                                                      0.1s 
 ✔ Container dice-assignment2-part2-webapp-1  Recreated                                                                                                      0.1s 
 ✔ Container dice-assignment2-part2-webapp-2  Recreated                                                                                                     10.2s 
Attaching to dbapp-1, webapp-1, webapp-2, webapp-3
dbapp-1   | 2024-01-26 05:37:58+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
dbapp-1   | 2024-01-26 05:37:58+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
dbapp-1   | 2024-01-26 05:37:58+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.3.0-1.el8 started.
webapp-3  |  * Serving Flask app 'app'
webapp-3  |  * Debug mode: off
webapp-3  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
webapp-3  |  * Running on all addresses (0.0.0.0)
webapp-3  |  * Running on http://127.0.0.1:80
webapp-3  |  * Running on http://172.19.0.3:80
webapp-3  | Press CTRL+C to quit
dbapp-1   | '/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
dbapp-1   | 2024-01-26T05:37:59.194922Z 0 [System] [MY-015015] [Server] MySQL Server - start.
dbapp-1   | 2024-01-26T05:37:59.384889Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.3.0) starting as process 1
dbapp-1   | 2024-01-26T05:37:59.392807Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
webapp-2  |  * Serving Flask app 'app'
webapp-2  |  * Debug mode: off
webapp-2  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
webapp-2  |  * Running on all addresses (0.0.0.0)
webapp-2  |  * Running on http://127.0.0.1:80
webapp-2  |  * Running on http://172.19.0.4:80
webapp-2  | Press CTRL+C to quit
webapp-1  |  * Serving Flask app 'app'
webapp-1  |  * Debug mode: off
webapp-1  | WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
webapp-1  |  * Running on all addresses (0.0.0.0)
webapp-1  |  * Running on http://127.0.0.1:80
webapp-1  |  * Running on http://172.19.0.5:80
webapp-1  | Press CTRL+C to quit
dbapp-1   | 2024-01-26T05:37:59.591748Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
dbapp-1   | 2024-01-26T05:37:59.806549Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
dbapp-1   | 2024-01-26T05:37:59.806578Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
dbapp-1   | 2024-01-26T05:37:59.809686Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
dbapp-1   | 2024-01-26T05:37:59.831578Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
dbapp-1   | 2024-01-26T05:37:59.831754Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.3.0'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
```
