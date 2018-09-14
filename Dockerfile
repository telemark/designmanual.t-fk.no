###########################################################
#
# Dockerfile for designmanual.t-fk.no
#
###########################################################

# Setting the base to nodejs 6
FROM mhart/alpine-node:6@sha256:a9a15d3dac0cc575701b3357a0e1674a2744d45c0d18bd23c3cc287a4ba70699

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
