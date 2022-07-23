FROM php:7.1-fpm-alpine

ADD uploads.ini /usr/local/etc/php/conf.d/uploads.ini
ADD opcache-recommended.ini /usr/local/etc/php/conf.d/opcache-recommended.ini
ADD session.ini /usr/local/etc/php/conf.d/session.ini

RUN apk add --no-cache \
# in theory, docker-entrypoint.sh is POSIX-compliant, but priority is a working, consistent image
		bash \
# BusyBox sed is not sufficient for some of our sed expressions
		sed

# install the PHP extensions we need
RUN set -ex; \
	\
	apk add --no-cache --virtual .build-deps \
		libjpeg-turbo-dev \
		libpng-dev \
	; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli opcache; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --virtual .wordpress-phpexts-rundeps $runDeps

RUN apk add --no-cache --virtual .build-deps \
    pcre-dev ${PHPIZE_DEPS} g++ make autoconf; \
    pecl install redis-3.1.6 && docker-php-ext-enable redis

RUN apk del --purge .build-deps
