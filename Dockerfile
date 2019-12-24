#FROM dockerhub.infi.com/intel:v1.0.1
FROM node:9
MAINTAINER devops@aximsoft.com
WORKDIR /docker-node
RUN mkdir /root/.ssh
COPY . /docker-node
COPY ./config /root/.ssh/config
RUN echo /root/.ssh/github_rsa > /root/.ssh/id_rsa && \
    chmod 400 /root/.ssh/id_rsa
RUN cd /docker-node && npm install
EXPOSE 3000:3000
CMD npm start;
