FROM ubuntu:22.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y git
RUN apt install -y cron
Run apt install -y vim

RUN cd / &&  git clone https://github.com/CoffeerLatte/coffeer.blog.git && cd coffeer.blog

COPY . /var/www/html/
COPY pull.sh /var/www/html/
COPY blog-pull-cronjob /etc/cron.d/

CMD ["service", "cron", "start;"]
RUN crontab /etc/cron.d/blog-pull-cronjob
