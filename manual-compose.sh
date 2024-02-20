#!/bin/bash

sudo docker stop $(sudo docker ps -a  -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images -q)

figlet Blog Build
sudo docker build -t blog-a -f docker/bloga/Dockerfile docker/bloga
sudo docker build -t blog-b -f docker/blogb/Dockerfile docker/blogb

figlet LB Build
sudo docker build -t lb -f docker/lb/Dockerfile docker/lb

figlet Run Jeon Seung Min
sudo docker run -d --name blog-a -p 8021:80 blog-a
sudo docker run -d --name blog-b -p 8022:80 blog-b
sudo docker run -d --name lb -p 9998:80 lb

figlet Docker Network
sudo docker network create abc
sudo docker network connect abc blog-a
sudo docker network connect abc blog-b
 
sudo docker network connect abc lb

sudo docker start lb


figlet PS Jeon Seung Min
sudo docker ps -a

#sl -alF
