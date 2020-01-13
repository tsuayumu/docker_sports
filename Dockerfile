FROM ruby:2.6.5-stretch
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         libssl-dev \
         mysql-client \
         default-libmysqlclient-dev \
         libjemalloc1 \
         build-essential \
         locales \
         vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN locale-gen ja_JP.UTF-8

COPY policy.xml /etc/ImageMagick-6/policy.xml

ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.1"
ENV TZ="Asia/Tokyo"
ENV LANG=ja_JP.UTF-8
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8

RUN mkdir -p /etc/secret
