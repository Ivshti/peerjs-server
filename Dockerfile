
# Node 4.4 on Debian Jessie
FROM node:argon

# Meta
MAINTAINER Ivo Georgiev <ivo@strem.io>
LABEL Description="PeerJS Server" Vendor="Smart Code ltd" Version="0.0.1"


# Create app directory
RUN mkdir -p /var/www/peerjs

# Install app dependencies
WORKDIR /var/www/peerjs
COPY package.json /var/www/peerjs
RUN npm install --silent 

# Bundle app source
WORKDIR /var/www/peerjs
COPY . /var/www/peerjs

EXPOSE 9000
ENV NODE_ENV production
CMD bin/peerjs --port 9000 --key stremioPeer

