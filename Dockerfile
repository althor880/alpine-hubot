FROM alpine

MAINTAINER Ryan Gifford <rgifford@gmail.com>

# Install dependencies
RUN apk update && apk upgrade \
  && apk add redis \
  && apk add nodejs \
  && apk add python \
  && apk add curl \
  && curl -sS https://bootstrap.pypa.io/get-pip.py | python \
  && pip install awscli \
  && npm install -g npm \
  && npm install -g coffee-script \
  && npm install -g yo generator-hubot \
  && apk --purge -v del py-pip \
  && rm -rf /var/cache/apk/*

# Create hubot user
RUN adduser -h /hubot -s /bin/bash -S hubot
USER  hubot
WORKDIR /hubot

# Install hubot
RUN yo hubot --owner="Ryan Gifford <rgifford@gmail.com>" --name="jules" --description="Lemons, all the time" --defaults
COPY package.json package.json
RUN npm install
ADD hubot/hubot-scripts.json /hubot/
ADD hubot/external-scripts.json /hubot/
ADD hubot/scripts /hubot/scripts

EXPOSE 80

# And go
ENTRYPOINT ["/bin/sh", "-c", "bin/hubot --adapter hipchat"]
