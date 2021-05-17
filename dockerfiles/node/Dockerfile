FROM node
MAINTAINER Joao Vieira

COPY . /var/www
WORKDIR /var/www
RUN npm install

ENTRYPOINT npm start

EXPOSE 8081