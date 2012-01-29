io = null

module.exports = 
  start: (port, cb) ->
    io = require("socket.io").listen port, cb
    io.sockets.on "connection", (socket) ->
      socket.on "connection name", (user) ->
        io.sockets.emit "new user", user.name + " has joined."

      socket.on 'message', (msg) ->
        io.sockets.emit 'message', msg

  stop: (cb) ->
    io.server.close()
    cb()

