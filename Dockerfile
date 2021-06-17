FROM node:16.3-alpine3.11

# Create app directory
WORKDIR /usr/src/app

RUN npm install -g @angular/cli

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./app/package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# EXPOSE 8080
# CMD [ "node", "server.js" ]
CMD [ "ng", "serve", "app", "-c=development",  "--host=0.0.0.0", "--port", "4200"]