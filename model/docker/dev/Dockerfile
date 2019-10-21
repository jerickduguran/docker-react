# stage: 1 — Development environment 
FROM node:12.12.0 as DockerReactWrapper

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH 

COPY package.json /usr/src/app/package.json
COPY .env.local /usr/src/app/.env
 
RUN npm install --silent    

# ADD src /usr/src/app/src/
# ADD public /usr/src/app/public

#uncomment below if allow testing
#RUN npm run test -- --browsers ChromeHeadlessNoSandbox --watch=false

#uncomment for dev
CMD ["npm", "start"] 