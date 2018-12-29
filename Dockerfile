############################################################ 
# Dockerfile to build image for A N Y P R O X Y
# Based on Debian:7
############################################################

FROM node:7-wheezy
MAINTAINER XinYe <nunchuk@live.com>

RUN { \
		echo 'deb http://mirrors.cloud.aliyuncs.com/debian/ wheezy main non-free contrib'; \
		echo 'deb http://mirrors.cloud.aliyuncs.com/debian/ wheezy-proposed-updates main non-free contrib'; \
		echo 'deb-src http://mirrors.cloud.aliyuncs.com/debian/ wheezy main non-free contrib'; \
		echo 'deb-src http://mirrors.cloud.aliyuncs.com/debian/ wheezy-proposed-updates main non-free contrib'; \
	} > /etc/apt/sources.list && cat /etc/apt/sources.list

RUN rm /etc/localtime && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	apt-get update -y && apt-get install python -y && \
	rm -rf /var/lib/apt/lists/*

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org && \
	cnpm install -g anyproxy