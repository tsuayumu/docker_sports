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
         cron \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# localeのUTF8を追加(システムに使いたいロケールがインストールされていない場合）
RUN locale-gen ja_JP.UTF-8

# メモリ使用量を効率化する
ENV LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libjemalloc.so.1"

# タイムゾーンの設定
ENV TZ="Asia/Tokyo"

# ロケール設定
ENV LANG=ja_JP.UTF-8

# locale-gen ja_JP.UTF-8と被ってる？？
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8

