#!/bin/bash

apt-get update -y
apt-get install -y nginx unzip curl

mkdir -p /var/www/frontend
echo "<h1>Hello from Frontend</h1>" > /var/www/frontend/index.html

cat > /etc/nginx/sites-available/frontend <<EOF
server {
    listen 80;
    server_name _;

    root /var/www/frontend;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

ln -s /etc/nginx/sites-available/frontend /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

systemctl restart nginx
