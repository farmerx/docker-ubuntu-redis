# Dockerfile for Redis based services

This is the Dockerfile which enables building the base Docker image
to be used by redis services.

## Building

```
docker build -t redis:latest .

```


## Running

```
docker run --name redis -p 6379:6379 -P -v d:/docker/redis/log:/var/log/redis/ -v d:/docker/redis/data:/var/lib/redis/ -d redis:latest

```
