# Neuste Nginx Image
FROM nginx:latest
# Admin des Container
MAINTAINER Erduan erduan.saiti@edu.tbz.ch
# Update und Upgrade des System + Installation von PHP
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y php-fpm
# index File ins RootDocument von Nginx
COPY index.html /var/www/html/
# Benutzter Port
EXPOSE 80
