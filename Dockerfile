FROM ubuntu:latest

MAINTAINER farmerx "farmerx@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y vim wget curl openssh-server
RUN mkdir /var/run/sshd

# 将sshd的UsePAM参数设置成no
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN echo "root:123456" | chpasswd

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22

# 安装python 扩展 
#RUN apt-get install -y software-properties-common 

# 添加redis redis3.0
RUN apt-get install -y redis-server

COPY redis.conf /etc/redis/redis.conf

CMD ["/usr/bin/supervisord"]

RUN apt-get install -y net-tools 
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# redis disk
# VOLUME ["/var/lib/redis/"]

# redis log
# VOLUME ["/var/log/redis/redis-server.log"]

EXPOSE 6379

# 启动方式
# docker run --name redis -p 6379:6379 -P -v d:/docker/redis/log:/var/log/redis/ -v d:/docker/redis/data:/var/lib/redis/ -d redis:latest

















