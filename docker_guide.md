# GoClimb Guide for Docker
## [Watch a video about Docker](https://youtu.be/eGz9DS-aIeY)
<br>
<br>

## Install Docker Desktop (or Docker and Docker compose)
https://www.docker.com/products/docker-desktop/
<br>
<br>

## On Linux(or windows WSL) you have to add a sudo in front of the docker command every time, or do some postinstall settings:
https://docs.docker.com/engine/install/linux-postinstall/
<br>
<br>

## You will have to stop your current postgres instance from running
```
sudo service postgresql stop
```
<br>
<br>

## **How to run all docker containers for GoClimb:**
```
docker-compose up
```
Or if you don't want to see the logs of the containers
```
docker-compose up -d
```
Or if there is a change in dependencies (like a new gem)
```
docker-compose up --build
```
<br>
<br>

## How to execute a rails command inside of a docker container:

1. find all of your running containers with:

```
docker ps
```
2. Look for the name (all the way on the right)
```
CONTAINER ID   IMAGE                      COMMAND                  CREATED         STATUS         PORTS                    NAMES
47ba0a61d94b   goclimb-rails              "rails server -b 0.0…"   4 minutes ago   Up 4 minutes   0.0.0.0:3000->3000/tcp   goclimb-rails-1
ea23a8f48086   adminer                    "entrypoint.sh docke…"   4 minutes ago   Up 4 minutes   0.0.0.0:8080->8080/tcp   goclimb-adminer-1
49d9c3b32ba1   postgres:14.5-alpine3.16   "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes   0.0.0.0:5432->5432/tcp   goclimb-db-1
```

3. execute the command that you want to run with docker exec:

```
docker exec -it goclimb-rails-1 rails db:seed
```
<br>
<br>

## How to fix the Error: A server is already running. Check /usr/src/app/tmp/pids/server.pid.
https://stackoverflow.com/questions/35022428/rails-server-is-still-running-in-a-new-opened-docker-container/38732187#38732187
```
sudo rm tmp/pids/server.pid
```
I am working on a fix.
<br>
<br>

## How to use adminer
Adminer is a user interface on the web, to display contents of the database.
Go to http://localhost:8080/
Select the following options:
-  database system: postgresql
-  server: db
-  user: postgres
-  password: password
-  database: postgres
