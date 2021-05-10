FROM alpine:latest
RUN apk update \
  && apk add --no-cache nginx php7-fpm  \
    supervisor

COPY nginx.conf /etc/nginx/nginx.conf
COPY configure.sh /configure.sh
COPY supervisord.conf /etc/supervisord.conf
COPY data-web/ /var/lib/nginx/html/

EXPOSE 80/tcp

RUN sh /configure.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
