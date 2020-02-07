FROM daocloud.io/library/ubuntu:16.04
RUN mv /etc/apt/sources.list /etc/apt/sources.list.backup
#查看阿里云镜像源https://developer.aliyun.com/mirror/?spm=a2c6h.13651104.0.d1002.2ed994ddebktHj
ADD sources.list /etc/apt/
RUN apt-get update \
    && apt-get install -y vim net-tools sudo
