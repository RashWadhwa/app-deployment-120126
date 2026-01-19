#!/bin/bash
# Script to deploy NGINX server
# update packages
sudo apt update -y

# install NGINX
sudo apt install nginx -y

# start NGINX service
sudo systemctl restart nginx

# enable NGINX to start on boot
sudo systemctl enable nginx

