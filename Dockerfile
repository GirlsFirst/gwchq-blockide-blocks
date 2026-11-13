FROM 081679173013.dkr.ecr.us-west-2.amazonaws.com/gwc-node:24.18.0-alpine3.24 AS build

# google-closure-compiler is a Java 8-era jar: keep JRE 11, do not bump to 17+.
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH=$PATH:$JAVA_HOME/bin

# openjdk11-jre - for google-closure-compiler; python3 - for build.py
RUN apk add --no-cache openjdk11-jre python3

WORKDIR /app/src

# Install dependencies first so the layer is cached independently of source changes.
COPY package.json yarn.lock /app/src/
RUN yarn install --frozen-lockfile

COPY . /app/src

# The bundle is built explicitly: `prepack` only runs on publish, not on install.
RUN yarn build
