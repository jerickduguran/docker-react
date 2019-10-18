FROM node:latest 
RUN npm install npx

WORKDIR /var/www/html/ 
RUN npx create-react-app app