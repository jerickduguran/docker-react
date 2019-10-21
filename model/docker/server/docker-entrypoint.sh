#!/bin/sh
set -e 
cd /usr/share/nginx/app 

echo "installing node modules..."
npm install --silent 

echo "building project..."
npm run build
cp -a /usr/share/nginx/app/build/. /usr/share/nginx/html

echo "Creating symlink...." 
ln -s /data/webapp/application/uploads/logo.svg /usr/share/nginx/html/assets/logo.svg -f
ln -s /data/webapp/application/uploads/main_bg.jpeg /usr/share/nginx/html/assets/main_bg.jpeg -f
ln -s /data/webapp/application/uploads/preloader.gif /usr/share/nginx/html/assets/preloader.gif -f
ln -s /data/webapp/application/uploads/favicon.ico /usr/share/nginx/html/assets/favicon.ico -f
ln -s /data/webapp/application/uploads/mload.gif /usr/share/nginx/html/assets/mload.gif -f
ln -s /data/webapp/application/uploads/score.svg /usr/share/nginx/html/assets/icons/score.svg -f
ln -s /data/webapp/application/uploads/page_404.jpg /usr/share/nginx/html/assets/page_404.jpg -f

echo "Removing build dependencies...."
cd /usr/share/nginx 

rm -rf /usr/share/nginx/app 
rm -rf /usr/bin/node
rm -rf /usr/bin/npm
rm -rf /usr/lib/node_modules 

exec "$@"