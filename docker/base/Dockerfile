FROM php:8.0.6-apache-buster as php-plain-base

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install git bash
RUN groupadd --gid 1000 php-plain \
  && useradd --uid 1000 --gid php-plain --shell /bin/bash --create-home php-plain

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

WORKDIR /home/php-plain/project
