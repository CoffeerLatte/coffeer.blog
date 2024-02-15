FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx

copy . /var/www/html/


CMD ["nginx", "-g", "daemon off;"]
