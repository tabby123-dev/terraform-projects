#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
echo "<h1>Welcome to my EC2 instance!</h1>" | sudo tee /var/www/html/index.html 