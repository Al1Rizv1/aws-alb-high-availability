#!/bin/bash
dnf update -y
dnf install httpd -y
systemctl start httpd
systemctl enable httpd
echo '<!DOCTYPE html><html><body style="background-color:green;color:white;text-align:center;font-family:sans-serif;padding-top:50px;"><h1>Server 2 – Green Page</h1><p>Provisioned automatically via Terraform</p></body></html>' > /var/www/html/index.html
