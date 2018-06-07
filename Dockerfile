###########################################################
#
# Dockerfile for designmanual.t-fk.no
#
###########################################################

# Setting the base to nodejs 6
FROM mhart/alpine-node:6@sha256:a45e14794a649a5f99bf5677c28ad711d8d0dd7311f79c32266a90214d3e34ad

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
