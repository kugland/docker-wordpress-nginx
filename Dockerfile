FROM nginx:1.24.0-alpine

LABEL org.opencontainers.image.title="wordpress-nginx" \
      org.opencontainers.image.description="nginx docker image for my WordPress stack" \
      org.opencontainers.image.source="https://github.com/kugland/docker-wordpress-nginx" \
      org.opencontainers.image.authors="André Kugland <kugland@gmail.com>"

COPY ./set-uid-gid.sh /docker-entrypoint.d/00-set-uid-gid.sh
RUN chmod +x /docker-entrypoint.d/00-set-uid-gid.sh
COPY ./wait-for-upstream.sh /docker-entrypoint.d/10-wait-for-upstream.sh
RUN chmod +x /docker-entrypoint.d/10-wait-for-upstream.sh

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./php-fpm.conf /etc/nginx/snippets/php-fpm.conf
COPY ./auth_basic.conf /etc/nginx/snippets/auth_basic.conf

VOLUME [ "/var/log/nginx" ]
VOLUME [ "/var/www/html" ]
