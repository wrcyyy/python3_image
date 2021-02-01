FROM ubuntu:20.04
MAINTAINER wrcyyy@126.com
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/* /tmp/*
ADD sources.list /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends python3 python3-pip tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && dpkg-reconfigure --frontend noninteractive tzdata \
    && pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && rm -rf /var/lib/apt/lists/* /tmp/*