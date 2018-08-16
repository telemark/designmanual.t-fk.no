###########################################################
#
# Dockerfile for designmanual.t-fk.no
#
###########################################################

# Setting the base to nodejs 6
FROM mhart/alpine-node:6@sha256:084cf753830635c4da8668089c1eaed3dd1c323a0453c823fb3ef05357d2bbf5

# Maintainer
MAINTAINER Jonas Enge

#### Begin setup ####

# Extra tools for native dependencies
#RUN apk add --no-cache make gcc g++ python

# Bundle app source
COPY . /src

# Change working directory
WORKDIR "/src"

# Install dependencies
RUN npm install --production

# Env variables
ENV SERVER_PORT 3000

# Expose 3000
EXPOSE 3000

# Startup
ENTRYPOINT node index.js
