###########################################################
#
# Dockerfile for designmanual.t-fk.no
#
###########################################################

# Setting the base to nodejs 6
FROM mhart/alpine-node:6@sha256:ffc7955a5fce42bf3148dd069ebb9ee59d36c657b95d0a6eb3bf4c1370ca50c7

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
