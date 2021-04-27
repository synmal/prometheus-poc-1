FROM ruby:3.0.1-alpine

RUN apk add --update --no-cache --quiet \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      openssl \
      pkgconfig \
      postgresql-dev \
      python3 \
      tzdata

RUN bundle config --global frozen 1

WORKDIR /prometheus-poc-1

COPY Gemfile Gemfile.lock ./

RUN bundle install --jobs=4 --quiet

COPY . .