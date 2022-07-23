FROM alpine:3.4

RUN mkdir /var/wordpress
WORKDIR /var/wordpress

COPY ./bootstrap.sh /var/bootstrap.sh
COPY ./wordpress.tar.gz /var/wordpress.tar.gz
COPY ./wp-config.php /var/wp-config.php

ENTRYPOINT []
CMD ["/var/bootstrap.sh"]
