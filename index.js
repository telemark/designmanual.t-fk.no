'use strict'

const Hapi = require('hapi')
const Inert = require('inert')
const path = require('path')
const config = require('./config')

// Create a server with a host and port
const server = new Hapi.Server({
  connections: {
    routes: {
      files: {
        relativeTo: path.join(__dirname, 'public')
      }
    }
  }
})

server.connection({
  port: config.port
})

server.register(Inert, () => {})

// Add the route to receive a webhook request
server.route(
  [
    {
      method: 'GET',
      path: '/{param*}',
      handler: {
        directory: {
          path: '.',
          redirectToSlash: true,
          index: true
        }
      }
    }
  ]
)

// Start the server
server.start(function (err) {
  if (err) {
    throw err
  }
  console.log(`Server running at: ${server.info.uri}`)
})

