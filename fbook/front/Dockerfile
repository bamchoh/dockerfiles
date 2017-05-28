FROM ubuntu:16.04

WORKDIR /root
RUN apt-get update
RUN apt-get -f install
RUN apt-get install -y git
RUN apt-get install -y nodejs npm curl
RUN npm cache clean
RUN npm install n -g
RUN n stable
RUN ln -sf /usr/local/bin/node /usr/bin/node
RUN ln -sf /usr/local/bin/npm /usr/bin/npm
RUN node -v
RUN npm -v
RUN apt-get purge -y nodejs npm
RUN mkdir jwt
WORKDIR /root/jwt
VOLUME /root/jwt
EXPOSE 3000
# CMD bash -c "npm install && npm run build-js && npm run dev"

