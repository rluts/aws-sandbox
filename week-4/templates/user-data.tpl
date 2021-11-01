#!/bin/bash

amazon-linux-extras install nginx1 -y
systemctl enable nginx

echo "<html><h1>${index_text}</h1></html>" > /usr/share/nginx/html/index.html
systemctl start nginx


