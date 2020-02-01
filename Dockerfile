FROM daocloud.io/library/ubuntu:16.04
RUN mv /etc/apt/sources.list /etc/apt/sources.list.backup
#查看阿里云镜像源https://developer.aliyun.com/mirror/?spm=a2c6h.13651104.0.d1002.2ed994ddebktHj
ADD sources.list /etc/apt/
RUN apt-get update \
    && apt-get install -y vim \
    && apt-get install -y sudo 
#    && apt-get install -y tree \
#    && apt-get install -y net-tools \
#    && apt-get install -y git \
#    && apt-get install -y nginx \
#    && apt-get install -y redis-server \
#    && apt-get install -y python2.7 \
#    && apt-get install -y python3.7 \
#    && apt-get install -y python3-pip \
#    && apt-get install -y python-pip python-dev build-essential \
#    && apt-get install -y mysql-server \
#    && apt install -y mysql-client \
#    && apt install -y libmysqlclient-dev
