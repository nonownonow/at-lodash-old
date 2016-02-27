process.on 'uncaughtException', (err)->
  console.error err.stack
require('http').createServer (req, res)->
  console.log   'stdout from httpserver'
  res.end '1st Node.js Korea Conference'
  throw new Error 'stderr'
.listen 1338