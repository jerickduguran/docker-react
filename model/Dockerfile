
# stage: 1 — Development environment
FROM node:12.12.0  as BaseApp 
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app 
# Move files to image
COPY . /usr/src/app   
RUN mv .env.local .env

#stage: 2 — Generate Server
FROM nginx:alpine as Server
LABEL maintainer="Jerick Y. Duguran <jerick.duguran@gmail.com>"
# Remove default nginx config
RUN rm -rf /etc/nginx/conf.d
# Copy Custom Nginx Config
COPY /docker/server/conf /etc/nginx 
# Copy Project source to server dir
COPY --from=BaseApp /usr/src/app /usr/share/nginx/app 
# Copy initial public files to web root directory
COPY /docker/server/public /usr/share/nginx/html
# Copy docker entry point to server
COPY /docker/server/docker-entrypoint.sh /usr/local/bin/docker-entrypoint 
# Make entrypoint executable, print commands , exit on error
RUN set -eux; \ 
    chmod +x /usr/local/bin/docker-entrypoint 
#  change working dir to target build 
# WORKDIR /usr/share/nginx/app 
# install node / node npm in web server
RUN apk add --update nodejs nodejs-npm 

ENTRYPOINT ["docker-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]  