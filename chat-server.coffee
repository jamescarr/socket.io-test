io = null
clients = {}

module.exports = 
  start: (port, cb) ->
    io = require("socket.io").listen port, cb
    io.sockets.on "connection", (socket) ->
      userName = ''
      socket.on "connection name", (user) ->
        clients[user.name] = socket
        userName = user.name
        io.sockets.emit "new user", user.name + " has joined."

      socket.on 'message', (msg) ->
        io.sockets.emit 'message', msg

      socket.on 'private message', (msg) ->
        fromMsg = 
          from: userName
          txt: msg.txt
        clients[msg.to].emit 'private message', fromMsg
  stop: (cb) ->
    io.server.close()
    cb()

