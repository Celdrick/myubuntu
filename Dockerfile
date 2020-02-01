FROM daocloud.io/library/ubuntu:16.04

RUN mv /etc/apt/sources.list /etc/apt/sources.list.backup
#查看阿里云镜像源https://developer.aliyun.com/mirror/?spm=a2c6h.13651104.0.d1002.2ed994ddebktHj

ADD sources.list /etc/apt/
RUN apt-get update \
    && apt-get install -y vim net-tools sudo python git wget libssl-dev\
    && apt-get install -y python-pip \
    && pip install --upgrade pip \
    && apt-get install -y python-magic python-libvirt ssdeep \
    && pip install sqlalchemy dpkt jinja2 pymongo bottle pefile  \
    && apt-get install -y build-essential git libpcre3 libpcre3-dev libpcre++-dev  python-dev libfuzzy-dev

#安装pydeep,将pydeep下载到opt目录下
RUN git clone https://github.com/kbandla/pydeep.git /opt/pydeep/ \
    && cd /opt/pydeep/ \
    && python setup.py build \
    && python setup.py install

#安装yara
RUN apt-get install -y automake libtool make gcc
RUN cd ~ \
    && wget https://github.com/VirusTotal/yara/archive/v3.11.0.tar.gz \
    && cd yara-3.5.0/ \
    && ./bootstrap.sh
RUN apt-get install -y flex bison \
    && ./configure \
    && make \
    && make install
RUN pip install yara-python

#安装tcpdump用于dump网络通讯状况
RUN apt-get install tcpdump
