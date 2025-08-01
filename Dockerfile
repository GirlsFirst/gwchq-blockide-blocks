FROM node:20.18.0-alpine3.20

ARG ENVIRONMENT=development

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

# Install the latest Java LTS JRE
RUN apk add --no-cache openjdk11-jre

RUN apk add --no-cache python3 py3-pip

RUN apk add --no-cache zip

WORKDIR /app
COPY . /app/src

WORKDIR /app/src

RUN npm install
